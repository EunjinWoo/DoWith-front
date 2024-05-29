import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        title: Text('LIVE')
      ),
      body: FutureBuilder<void>(
        future: init(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if(snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          return Stack(
            children: [
              Container(
                child: renderMainView(),
              ),
              Container(
                width: 120,
                height: 160,
                child: AgoraVideoView( // uid 를 기반으로 우리가 아고라 서버에 우리 화면을 전송할 수 있는 것.
                  controller: VideoViewController(
                    rtcEngine: engine!,
                    canvas: VideoCanvas(
                      uid: uid,
                    )
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 16,
                right: 16,
                child: ElevatedButton(
                  onPressed: (){
                    engine!.leaveChannel();
                    engine!.release();

                    Navigator.of(context).pop(); // 뒤로 가기
                  },
                  child: Text('나가기'),
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
        child: CircularProgressIndicator(),
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
