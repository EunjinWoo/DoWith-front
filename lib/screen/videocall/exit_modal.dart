import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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