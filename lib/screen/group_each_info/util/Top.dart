import 'package:dowith/screen/group_each_info/util/Top_intro.dart';
import 'package:dowith/screen/group_each_info/util/Top_members.dart';
import 'package:flutter/material.dart';

class eachGroupinfoPage_body_top extends StatelessWidget {
  const eachGroupinfoPage_body_top({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 8,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Row(
          children: [
            eachGroupinfoPage_body_top_intro(),
            eachGroupinfoPage_body_top_members()
          ],
        ),
      ),
    );
  }
}
