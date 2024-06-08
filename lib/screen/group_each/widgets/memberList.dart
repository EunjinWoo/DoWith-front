import 'package:dowith/screen/group_each/util/mamberList_Name.dart';
import 'package:dowith/screen/group_each/util/memberList_Progress.dart';
import 'package:dowith/screen/group_each/util/memberList_Todos.dart';
import 'package:dowith/screen/group_each_member/group_each_member.dart';
import 'package:flutter/material.dart';

class memberList extends StatelessWidget {
  final Map<String, int> membersProgress;
  const memberList({
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
                memberList_Name(name: key,), // name
                Expanded( // 중앙 todolist
                  child: memberList_Todos(),
                ), // todolist
                memberList_Progress(progress: membersProgress[key]), // progress
              ],
            ),
          );
        },
      ),
    );
  }
}

