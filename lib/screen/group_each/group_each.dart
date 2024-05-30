import 'dart:ui';

import 'package:dowith/screen/group_each_add_goals/group_each_add_goals.dart';
import 'package:dowith/screen/group_each_info/group_each_info.dart';
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
        toolbarHeight: -10,
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
                      child: _basePage(
                        title: widget.title,
                        groupIntro: groupIntro,
                        openShareModal: _openShareModal,
                    ),
                  ), // title + txt btns + group intro
                  _memberList(membersProgress: membersProgress,), // member list
                ],
              ),
            ),
          ),
          if (isShareModalOpen) _share_modal(closeShareModal: _closeShareModal),
        ],
      ),
    );
  }
}

class _basePage extends StatelessWidget {
  final String title;
  final String groupIntro;
  final VoidCallback openShareModal;

  _basePage({
    super.key,
    required this.title,
    required this.groupIntro,
    required this.openShareModal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          child: Transform.translate(
            offset: Offset(0,-15),
            child: Column( // title + txt btns
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _basePage_Title(title: title,), // title
                _basePage_TxtBtns(title: title, openShareModal: openShareModal,), // txt btns
              ],
            ),
          ),
        ), // title + txt btns
        _basePage_GroupIntro(groupIntro: groupIntro,), // group intro
      ],
    );
  }
}

class _memberList extends StatelessWidget {
  final Map<String, int> membersProgress;
  const _memberList({
    super.key,
    required this.membersProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 15, right: 15),
      constraints: BoxConstraints(maxHeight: 300),
      decoration: BoxDecoration(
        color: Colors.white,  // 배경색을 흰색으로 설정
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(37),
          topRight: Radius.circular(37),
        ),
        boxShadow: [  // 그림자 추가
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 20,
            offset: Offset(0, 3),  // 그림자의 위치 조정
          ),
        ],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: membersProgress.length,
        itemBuilder: (context, index) {
          String key = membersProgress.keys.elementAt(index);
          return Container(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // 요소들을 양쪽 끝으로 정렬
              children: <Widget>[
                _memberList_Name(name: key,), // name
                Expanded( // 중앙 todolist
                  child: _memberList_Todos(),
                ), // todolist
                _memberList_Progress(progress: membersProgress[key]), // progress
              ],
            ),
          );
        },
      ),
    );
  }
}

class _basePage_Title extends StatelessWidget {
  final String title;
  const _basePage_Title({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container( // title
      height: 120,
      width: double.infinity, // 화면 가로 전체
      alignment: Alignment.topCenter,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Arimo-Bold',
            color: Colors.black,
            fontSize: 150,
          ),
        ),
      ),
    );
  }
}

class _basePage_TxtBtns extends StatelessWidget {
  final String title;
  final VoidCallback openShareModal;

  const _basePage_TxtBtns({
    super.key,
    required this.title,
    required this.openShareModal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Transform.translate(
        offset: Offset(0, -10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding( // info
              padding: EdgeInsets.only(bottom: 4), // 여기서 padding 값을 조절하여 원하는 크기를 설정할 수 있습니다.
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => eachGroupinfoPage(title: title,)),
                  );
                },
                child: Text(
                    "info",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Arimo-Regular'
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VideoCall()),
                    );
                  },
                  child: Text("video call", style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Arimo-Regular'))),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: GestureDetector(
                onTap: openShareModal,
                child: Text(
                    "share",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Arimo-Regular'
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Text("members", style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Arimo-Regular')),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => eachGroupAddGoalsPage()),
                  );
                },
                  child: Text(
                      "add goals",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Arimo-Regular'
                      )
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _basePage_GroupIntro extends StatelessWidget {
  final String groupIntro;
  const _basePage_GroupIntro({super.key, required this.groupIntro});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 15, bottom: 15),
      width: 300,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          groupIntro,
          style: TextStyle(fontSize: 28,fontFamily: 'Arimo-Regular', color: Colors.white),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}

class _memberList_Name extends StatelessWidget {
  final String name;
  const _memberList_Name({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container( // name
      width: 110, // name 고정 너비
      alignment: Alignment.centerLeft,
      child: Text(
        name,
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Arimo-Bold',
        ),
      ),
    );
  }
}

class _memberList_Todos extends StatelessWidget {
  const _memberList_Todos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Column 내부의 내용을 중앙 정렬
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('73829',
          style: TextStyle(
            fontFamily: 'Arimo-Regular',
            fontSize: 11,
            color: key == 'Jimin' ? Color(0xFF8B8B8B) : Colors.black,
            decoration: key == 'Jimin' ? TextDecoration.lineThrough : TextDecoration.none,
            decorationColor: key == 'Jimin' ? Color(0xFF8B8B8B) : Colors.black,
          ),
        ), // 추가 정보
        Text('38290',
          style: TextStyle(
            fontFamily: 'Arimo-Regular',
            fontSize: 11,
            color: key != 'Eun' ? Color(0xFF8B8B8B) : Colors.black,
            decoration: key != 'Eun' ? TextDecoration.lineThrough : TextDecoration.none,
            decorationColor: key != 'Eun' ? Color(0xFF8B8B8B) : Colors.black,
          ),
        ), // 추가 정보
        Text('Programmers-#27',
          style: TextStyle(
            fontFamily: 'Arimo-Regular',
            fontSize: 11,
            color: Color(0xFF8B8B8B),
            decoration: TextDecoration.lineThrough,
            decorationColor: Color(0xFF8B8B8B),
          ),
        ), // 추가 정보
      ],
    );
  }
}

class _memberList_Progress extends StatelessWidget {
  final progress;
  const _memberList_Progress({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${progress}%",
      style: TextStyle(
        fontSize: 20,
        fontFamily: 'Arimo-Bold',
        color: progress == 100 ? Color(0xFFFF5500) : Colors.black,
      ),
    );
  }
}

class _share_modal extends StatefulWidget {
  final VoidCallback closeShareModal;

  const _share_modal({super.key, required this.closeShareModal});

  @override
  State<_share_modal> createState() => _share_modalState();
}

class _share_modalState extends State<_share_modal> {
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
