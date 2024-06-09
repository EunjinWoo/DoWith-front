import 'package:dowith/screen/each_goal_detail/each_goal_detail.dart';
import 'package:dowith/screen/group_each_member/util/eachDateToggle.dart';
import 'package:flutter/material.dart';

class eachGroupMemberPage_dateListView extends StatefulWidget {
  final String name;

  eachGroupMemberPage_dateListView({super.key, required this.name});

  @override
  State<eachGroupMemberPage_dateListView> createState() => eachGroupMemberPage_dateListViewState();
}

class eachGroupMemberPage_dateListViewState extends State<eachGroupMemberPage_dateListView> {
  final List eachMemberHistory = [
    {
      "id": 1,
      "date_range" : "0505 - 11",
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
          "image" : 'assets/img/ex_group_each_member/historyEx3.jpeg',
          "comment" : '완료우',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
      ]
    },
    {
      "id": 2,
      "date_range" : "0429 - 05",
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
          "title" : "English",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/historyEx1.jpeg',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "UIUX",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/historyEx2.png',
          "comment" : '피그마 했습니당\n오늘도 파이팅~~\n굿굿',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "file processing",
          "done" : 1,
          "image" : 'assets/img/ex_group_each_member/historyEx4.jpeg',
          "comment" : '',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "Deliability\nfunction",
          "done" : 0,
          "image" : null,
          "comment" : '',
          "created_at" : '2023-01-16',
          "updated_at" : '2023-05-26',
        },
        {
          "title" : "Tistory",
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
              if (whatDateToggleOpen == index) eachDateToggle(eachMemberEachDateHistory: eachMemberHistory[index], author: widget.name)
            ],
          );
        },
      ),
    );
  }
}
