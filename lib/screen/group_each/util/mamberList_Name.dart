import 'package:dowith/screen/group_each_member/group_each_member.dart';
import 'package:flutter/material.dart';

class memberList_Name extends StatelessWidget {
  final String name;
  const memberList_Name({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container( // name
      width: 110, // name 고정 너비
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => eachGroupMemberPage(name: name,)),
          );
        },
        child: Text(
          name,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Arimo-Bold',
          ),
        ),
      ),
    );
  }
}