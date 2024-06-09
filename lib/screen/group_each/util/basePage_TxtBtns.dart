import 'package:dowith/screen/group_each_add_goals/group_each_add_goals.dart';
import 'package:dowith/screen/group_each_info/group_each_info.dart';
import 'package:dowith/screen/videocall/videocall.dart';
import 'package:flutter/material.dart';

class basePage_TxtBtns extends StatelessWidget {
  final String title;
  final VoidCallback openShareModal;

  const basePage_TxtBtns({
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