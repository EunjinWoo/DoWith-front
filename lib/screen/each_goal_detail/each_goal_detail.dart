import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class eachGoalDetailPage extends StatelessWidget {
  final String author;
  final Map goalDetail;
  /*
  {
  "title" : "73829",
  "done" : 1,
  "image" : 'assets/img/ex_group_each_member/73829_eachMemberExample.png',
  "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
  "created_at" : '2023-01-16',
  "updated_at" : '2023-05-26',
  },
  */
  const eachGoalDetailPage({super.key, required this.author, required this.goalDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: -8,),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  author,
                  style: TextStyle(
                      fontFamily: 'Arimo-Medium',
                      fontSize: 30,
                  ),
                ),
                Text(
                  goalDetail["created_at"],
                  style: TextStyle(
                    fontFamily: 'Pretendard-Regular',
                    fontSize: 15,
                    color: Color(0xFFF4F4F4F)
                  ),
                )
              ],
            ),
          ),
          Divider(color: Colors.black, height: 0, thickness: 1,),
          Container(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid)
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: (goalDetail["image"] != null) ? Image.asset(goalDetail["image"], fit: BoxFit.cover,) : Container(color: Colors.black.withOpacity(0.7),)
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  color: Color(0xFFEBEBEB),
                  child: Text(
                    goalDetail["title"],
                    style: TextStyle(
                      fontFamily: 'Pretendard-Medium',
                      fontSize: 25,
                      color: Color(0xFF4F4F4F),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
          Divider(color: Colors.black, height: 0, thickness: 1,),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  goalDetail["comment"],
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Pretendard-Regular'
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
