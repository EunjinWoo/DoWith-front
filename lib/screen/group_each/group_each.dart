import 'dart:ui';

import 'package:dowith/screen/group_each/widgets/basePage.dart';
import 'package:dowith/screen/group_each/widgets/memberList.dart';
import 'package:dowith/screen/group_each/widgets/shareModal.dart';
import 'package:dowith/screen/group_each_add_goals/group_each_add_goals.dart';
import 'package:dowith/screen/group_each_info/group_each_info.dart';
import 'package:dowith/screen/group_each_member/group_each_member.dart';
import 'package:dowith/screen/videocall/videocall.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GroupDetailPage extends StatefulWidget {
  final String title;

  GroupDetailPage({required this.title});

  @override
  State<GroupDetailPage> createState() => _GroupDetailPageState();
}

class _GroupDetailPageState extends State<GroupDetailPage>  {
  final Map<String, int> membersProgress = {
    'Jimin': 100,
    'Sun': 66,
    'Eun': 33,
  };
  final groupIntro = 'Studying Algorithms From Baekjoon';

  bool isShareModalOpen = false;

  void _openShareModal() {
    setState(() {
      if (!isShareModalOpen) {
        isShareModalOpen = true;
      }
    });
  }

  void _closeShareModal() {
    setState(() {
      if (isShareModalOpen) {
        isShareModalOpen = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFFF5500),
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white, // 글자색 흰색
        toolbarHeight: -5,
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: _closeShareModal,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFF3D00), // 시작 색상
                    Color(0xFFFF5602),
                    Color(0xFFFD864B),
                    Color(0xFFFCBA99),
                    Color(0xFFF9F9F9)  // 종료 색상
                  ],
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: basePage(
                        title: widget.title,
                        groupIntro: groupIntro,
                        openShareModal: _openShareModal,
                    ),
                  ), // title + txt btns + group intro
                  memberList(membersProgress: membersProgress,), // member list
                ],
              ),
            ),
          ),
          if (isShareModalOpen) share_modal(closeShareModal: _closeShareModal),
        ],
      ),
    );
  }
}



