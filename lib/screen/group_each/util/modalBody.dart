import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class modalBody extends StatelessWidget {
  final String groupShareCode;
  final bool isShareCodeCopied;
  final VoidCallback copy;

  const modalBody({super.key, required this.groupShareCode, required this.copy, required this.isShareCodeCopied});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            'Group code issued.\nShare this group code with other users\nwho want to join the group.\nThe code is valid for up to 1 day.',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Arimo-Medium',
              color: Color(0xFF929292),
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25,),
          codeBox(groupShareCode: groupShareCode, copy: copy,),
          noticeCodeCopied(isShareCodeCopied: isShareCodeCopied,),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

class codeBox extends StatelessWidget {
  final String groupShareCode;
  final VoidCallback copy;

  const codeBox({super.key, required this.groupShareCode, required this.copy});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(style: BorderStyle.solid, color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      width: double.infinity,
      height: 75,
      child: Row(
        children: [
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                groupShareCode,
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Arimo-Medium',
                ),
              ),
            ),
          ),
          SizedBox(width: 10,),
          GestureDetector(
              onTap: copy,
              child: Image.asset(
                'assets/img/copy_icon.png',
                height: 35,
              )
          ),
        ],
      ),
    );
  }
}


class noticeCodeCopied extends StatelessWidget {
  final bool isShareCodeCopied;

  const noticeCodeCopied({super.key, required this.isShareCodeCopied});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
