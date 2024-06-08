import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class share_modal extends StatefulWidget {
  final VoidCallback closeShareModal;

  const share_modal({super.key, required this.closeShareModal});

  @override
  State<share_modal> createState() => share_modalState();
}

class share_modalState extends State<share_modal> {
  final String groupShareCode = 'D57SK81';
  bool isShareCodeCopied = false;

  void copy(){
    setState(() {
      Clipboard.setData(ClipboardData(text: groupShareCode));
      isShareCodeCopied = true;
    });
  }

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
                        onTap: widget.closeShareModal,
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
                      'Share your Group!',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Arimo-Bold'
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'Group code issued. Share this group code with other users who want to join the group. The code is valid for up to 1 day.',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Arimo-Medium',
                        color: Color(0xFF929292),
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25,),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(style: BorderStyle.solid, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            groupShareCode,
                            style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'Arimo-Medium'
                            ),
                          ),
                          GestureDetector(
                              onTap: copy,
                              child: Image.asset(
                                'assets/img/copy_icon.png',
                                height: 35,
                              )
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top:8.0, left: 15),
                      child: Text(
                        'Code Copied!',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Arimo-Medium',
                          color: isShareCodeCopied ? Color(0xFFFD531E) : Colors.transparent,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20,),
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