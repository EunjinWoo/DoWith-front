import 'package:dowith/screen/each_goal_detail/each_goal_detail.dart';
import 'package:dowith/screen/empty_appbar.dart';
import 'package:dowith/screen/group_each_member/widgets/dateListViewState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class eachGroupMemberPage extends StatelessWidget {
  final String name;
  const eachGroupMemberPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        toolbarHeight: -8,
        backgroundColor: Colors.white,
      ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(top: 50, left: 10, right: 10),
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'Arimo-Medium',
                    fontSize: 115,
                    height: 1
                  ),
                ),
              ),
            ),
            Divider(color: Colors.black, thickness: 1.0, height: 0,),
            eachGroupMemberPage_dateListView(name: name)
          ],
        ),
    );
  }
}
