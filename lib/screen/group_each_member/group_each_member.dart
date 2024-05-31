import 'package:dowith/screen/each_goal_detail/each_goal_detail.dart';
import 'package:dowith/screen/empty_appbar.dart';
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
            _eachGroupMemberPage_dateListView(name: name)
          ],
        ),
    );
  }
}

class _eachGroupMemberPage_dateListView extends StatefulWidget {
  final String name;

  _eachGroupMemberPage_dateListView({super.key, required this.name});

  @override
  State<_eachGroupMemberPage_dateListView> createState() => _eachGroupMemberPage_dateListViewState();
}

class _eachGroupMemberPage_dateListViewState extends State<_eachGroupMemberPage_dateListView> {
  final List eachMemberHistory = [
    {
      "id": 1,
      "date_range" : "This week",
      "progress" : 100,
      "goals" : [
        {
          "title" : "73829",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/73829_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "30286",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/30286_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "Programmers - #27",
          "done" : 0,
          "image" : null,
          "comment" : '',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
      ]
    },
    {
      "id": 2,
      "date_range" : "Last week",
      "progress" : 70,
      "goals" : [
        {
          "title" : "73829",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/73829_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "30286",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/30286_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "Programmers - #27",
          "done" : 0,
          "image" : null,
          "comment" : '',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
      ]
    },
    {
      "id": 3,
      "date_range" : "0422 - 28",
      "progress" : 90,
      "goals" : [
        {
          "title" : "73829",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/73829_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "30286",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/30286_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "Programmers - #27",
          "done" : 0,
          "image" : null,
          "comment" : '',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
      ]
    },
    {
      "id": 4,
      "date_range" : "0415 - 21",
      "progress" : 60,
      "goals" : [
        {
          "title" : "73829",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/73829_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "30286",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/30286_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "Programmers - #27",
          "done" : 0,
          "image" : null,
          "comment" : '',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
      ]
    },
    {
      "id": 5,
      "date_range" : "0408 - 14",
      "progress" : 88,
      "goals" : [
        {
          "title" : "73829",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/73829_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "30286",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/30286_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "Programmers - #27",
          "done" : 0,
          "image" : null,
          "comment" : '',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
      ]
    },
    {
      "id": 6,
      "date_range" : "0401 - 07",
      "progress" : 100,
      "goals" : [
        {
          "title" : "73829",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/73829_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "30286",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/30286_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "Programmers - #27",
          "done" : 0,
          "image" : null,
          "comment" : '',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
      ]
    },
    {
      "id": 7,
      "date_range" : "0325 - 31",
      "progress" : 100,
      "goals" : [
        {
          "title" : "73829",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/73829_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "30286",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/30286_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "Programmers - #27",
          "done" : 0,
          "image" : null,
          "comment" : '',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
      ]
    },
    {
      "id": 8,
      "date_range" : "0318 - 24",
      "progress" : 70,
      "goals" : [
        {
          "title" : "73829",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/73829_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "30286",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/30286_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "Programmers - #27",
          "done" : 0,
          "image" : null,
          "comment" : '',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
      ]
    },
    {
      "id": 9,
      "date_range" : "0311 - 17",
      "progress" : 100,
      "goals" : [
        {
          "title" : "73829",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/73829_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "30286",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/30286_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "Programmers - #27",
          "done" : 0,
          "image" : null,
          "comment" : '',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
      ]
    },
    {
      "id": 10,
      "date_range" : "0304 - 10",
      "progress" : 50,
      "goals" : [
        {
          "title" : "73829",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/73829_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "30286",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/30286_eachMemberExample.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "Programmers - #27",
          "done" : 0,
          "image" : null,
          "comment" : '',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
      ]
    },
  ];

  int whatDateToggleOpen = 0;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: eachMemberHistory.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    if (whatDateToggleOpen == index) {
                      whatDateToggleOpen = -1;
                    } else {
                      whatDateToggleOpen = index;
                    }
                  });
                },
                child: Container(
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
                      colors: (whatDateToggleOpen == index) ? [Color(0xFFFD531E),Color(0xFFFD7D55),] : [Color(0xFFFFFFF), Color(0xFFFFFFF)]
                    )
                  ),
                  padding: EdgeInsets.only(top: 23, left: 10, right: 10, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        eachMemberHistory[index]["date_range"],
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Arimo-Regular',
                          height: 1
                        ),
                      ),
                      Text(
                        '${eachMemberHistory[index]["progress"]}%',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Arimo-Regular',
                          height: 1
                        ),
                      )
                    ],
                  ),
                ),
              ),
              if (whatDateToggleOpen == index) Container(
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
                  itemCount: eachMemberHistory[index]["goals"].length,
                  itemBuilder: (BuildContext inEachDateContext, int inEachDateIndex) {
                    bool ifImageExists = (eachMemberHistory[index]["goals"][inEachDateIndex]["image"] != null);

                    return Container(
                      padding: EdgeInsets.all(15),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: GestureDetector(
                          onTap: (){
                            print(eachMemberHistory[index]["goals"][inEachDateIndex]["title"]);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => eachGoalDetailPage(author: widget.name ,goalDetail: eachMemberHistory[index]["goals"][inEachDateIndex],)),
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
                                    ? Image.asset(eachMemberHistory[index]["goals"][inEachDateIndex]["image"], fit: BoxFit.cover,)
                                    : Container(color: Colors.black.withOpacity(0.8),),
                                ),
                                Center(
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Text(
                                      eachMemberHistory[index]["goals"][inEachDateIndex]["title"],
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
              )
            ],
          );
        },
      ),
    );
  }
}
