import 'package:dowith/screen/each_goal_detail/each_goal_detail.dart';
import 'package:flutter/material.dart';

class eachDateToggle extends StatelessWidget {
  final eachMemberEachDateHistory;
  final String author;

  const eachDateToggle({super.key, required this.eachMemberEachDateHistory, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,  // 원하는 색상
            width: 1.0,           // 원하는 두께
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFD7D55),
            Color(0xFFFFBEA9)
          ],
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: eachMemberEachDateHistory["goals"].length,
        itemBuilder: (BuildContext inEachDateContext, int inEachDateIndex) {
          bool ifImageExists = (eachMemberEachDateHistory["goals"][inEachDateIndex]["image"] != null);

          return Container(
            padding: EdgeInsets.all(15),
            child: AspectRatio(
              aspectRatio: 1,
              child: GestureDetector(
                onTap: (){
                  print(eachMemberEachDateHistory["goals"][inEachDateIndex]["title"]);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => eachGoalDetailPage(author: author ,goalDetail: eachMemberEachDateHistory["goals"][inEachDateIndex],)),
                  );
                },
                child: Container(
                  // 여기서 AspectRatio를 안 했을 때 정사각형이 안 되는 이유를 모르겠음.
                  // height: 100,
                  // width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid)
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill( // Positioned.fill랑 아래 Boxfit.cover 같이 써줘야 적용됨. 왜인지는 아직 안 찾아 봄.
                        child: ifImageExists
                            ? Image.asset(eachMemberEachDateHistory["goals"][inEachDateIndex]["image"], fit: BoxFit.cover,)
                            : Container(color: Colors.black.withOpacity(0.8),),
                      ),
                      Center(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            eachMemberEachDateHistory["goals"][inEachDateIndex]["title"],
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Arimo-Bold',
                              color: Color(0xFFBEBEBE),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
