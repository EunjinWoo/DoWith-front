import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:dowith/const/keys.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({super.key});

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  RtcEngine? engine;

  int uid = 0; // 내가 방에 들어갔을 때 나의 아이디를 뭐로 할 것인가. 0으로 하면 랜덤으로 아고라에서 남아있는 아이디를 배정해줌.
  int? remoteUid;

  bool showExitModal = false;

  void _openExitModal() {
    setState(() {
      showExitModal = true;
    });
  }

  void _closeExitModal() {
    setState(() {
      showExitModal = false;
    });
  }

  void _exitVideoCall (){
    engine!.leaveChannel();
    engine!.release();

    Navigator.of(context).pop();
  }

  Future<void> init() async {
    final resp = await [Permission.camera, Permission.microphone].request();

    final cameraPermission = resp[Permission.camera];
    final microphonePermission = resp[Permission.microphone];

    if (cameraPermission != PermissionStatus.granted ||
    microphonePermission != PermissionStatus.granted) {
      throw '카메라 또는 마이크 권한이 없습니다.';
    }

    if(engine == null){
      engine = createAgoraRtcEngine();

      await engine!.initialize(
        RtcEngineContext(
          appId: appId,
        )
      );

      engine!.registerEventHandler(
        RtcEngineEventHandler( // 우리가 채널에 성공적으로 들어갔을 때 연결 정보랑, 얼마나 들어간지 오래됐는지 시간
          onJoinChannelSuccess: (
            RtcConnection connection,
            int elapsed
          ) {},
          onLeaveChannel: ( // 우리가 채널을 나갔을 때
            RtcConnection, RtcStats stats
          ) {},
          onUserJoined: ( // 상대가 들어왔을 때
              RtcConnection connection,
              int remoteUid,
              int elapsed
          ) {
            print('---User Joined.---');
            setState(() {
              this.remoteUid = remoteUid;
            });
          },
          onUserOffline: ( // 상대가 나갔을 때
            RtcConnection connection, // 연결 정보
            int remoteUid, // 누가 나갔는지
            UserOfflineReasonType reason,
          ) {
            setState(() {
              this.remoteUid = remoteUid;
            });
          }
        ),
      );

      await engine!.enableVideo();
      await engine!.startPreview();

      ChannelMediaOptions options = ChannelMediaOptions();

      await engine!.joinChannel(
          token: token,
          channelId: channelName,
          uid: uid,
          options: options
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: -5,
        backgroundColor: Color(0xFFEEEEEE),
      ),
      body: FutureBuilder<void>(
        future: init(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.black,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(color: Colors.white,),
              ),
            );
          }

          if(snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          return Column(
            children: [
              Container(
                  color: Color(0xFFEEEEEE),
                  height: 35,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          _openExitModal(); // _openExitModal만 하면 오류는 안 나는데 모달이 안 뜸. 왜지??
                        },
                        child: Image.asset(
                          'assets/img/close_btn.png',
                          height: 20,
                        ),
                      ),
                    ],
                  )
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      color: Colors.black,
                      child: renderMainView(),
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Container(
                        width: 140,
                        height: 190,
                        child: AgoraVideoView( // uid 를 기반으로 우리가 아고라 서버에 우리 화면을 전송할 수 있는 것.
                          controller: VideoViewController(
                            rtcEngine: engine!,
                            canvas: VideoCanvas(
                              uid: uid,
                            )
                          ),
                        ),
                      ),
                    ),
                    if(showExitModal) Center(child: _exit_modal(closeExitModal: _closeExitModal, exitVideoCall: _exitVideoCall,),)
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }

  renderMainView(){
    if (remoteUid == null) {
      return Center(
        child: CircularProgressIndicator(color: Colors.white,),
      );
    }

    return AgoraVideoView( // uid 를 기반으로 우리가 아고라 서버에 우리 화면을 전송할 수 있는 것.
        controller: VideoViewController.remote(
            rtcEngine: engine!,
            canvas: VideoCanvas(
              uid: remoteUid, // 상대의 uid
            ),
            connection: RtcConnection(
              channelId: channelName,
            )
        )
    );
  }
}

class _exit_modal extends StatefulWidget {
  final VoidCallback closeExitModal;
  final VoidCallback exitVideoCall;

  const _exit_modal({super.key, required this.closeExitModal, required this.exitVideoCall});

  @override
  State<_exit_modal> createState() => _exit_modalState();
}

class _exit_modalState extends State<_exit_modal> {
  bool isShareCodeCopied = false;

  @override
  Widget build(BuildContext context) {
    double mediaQuery = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: mediaQuery * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(2,4),
              )
            ]
        ),// 최소 높이를 화면 높이로 설정,
        child: IntrinsicHeight(
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10))
                  ),
                  height: 30,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          widget.closeExitModal();
                        },
                        child: Image.asset(
                          'assets/img/close_btn.png',
                          height: 17,
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    SvgPicture.asset('assets/img/Orange_Circle.svg'),
                    SizedBox(height: 30,),
                    Text(
                      'Leave this video call?',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Arimo-Bold'
                      ),
                    ),
                    SizedBox(height: 17,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: widget.exitVideoCall,
                          child: Container(
                            decoration: BoxDecoration(color: Color(0xFFFF3E01),
                              border: Border.all(style: BorderStyle.solid),
                              borderRadius: BorderRadius.all(Radius.circular(35))
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                            child: Text(
                              'exit',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Arimo-Regular',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        GestureDetector(
                          onTap: widget.closeExitModal,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(style: BorderStyle.solid),
                                borderRadius: BorderRadius.all(Radius.circular(35))
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                            child: Text(
                              'stay',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Arimo-Regular',
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 25,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}