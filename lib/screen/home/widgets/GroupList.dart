import 'package:dowith/screen/group_each/group_each.dart';
import 'package:dowith/screen/home/widgets/DynamicTaskView.dart';
import 'package:flutter/material.dart';

List<Map> myGroups = [
  {
    "title": "GoldClub",
    "progress": 22,
    "tasks": [
      {"title": '73829', "completed": true},
      {"title": '38290', "completed": true},
      {"title": 'Programmers #27', "completed": false},
      {"title": 'Flutter 마무리', "completed": false},
      {"title": '풀스택 수업 정리', "completed": false},
      {"title": 'Programmers #45', "completed": false},
      {"title": 'Baekjoon 14344', "completed": false},
      {"title": 'Baekjoon 14349', "completed": false},
      {"title": 'Programmers #50', "completed": false},
    ]
  },
  {
    "title": "StMHaaa",
    "progress": 0,
    "tasks": [
      {"title": 'GAN 논문', "completed": false},
      {"title": '38290', "completed": false},
      {"title": 'Programmers #27', "completed": false},
      {"title": '73829', "completed": false},
    ]
  },
  {
    "title": "CodingKunst",
    "progress": 0,
    "tasks": [
      {"title": '73829', "completed": false},
      {"title": '38290', "completed": false},
      {"title": 'Programmers #27', "completed": false},
      {"title": '73829', "completed": false},
      {"title": '38290', "completed": false},
      {"title": 'Programmers #27', "completed": false},
      {"title": '73829', "completed": false},
      {"title": '38290', "completed": false},
      {"title": 'Programmers #27', "completed": false},
    ]
  },
];

class GroupList extends StatefulWidget {
  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  final PageController _pageController = PageController(viewportFraction: 0.55);
  int _currentPageIndex = 0;

  void _updateProgress(int groupIndex) {
    setState(() {
      int completedTasks = myGroups[groupIndex]['tasks']
          .where((task) => task['completed'] as bool)
          .length;
      int totalTasks = myGroups[groupIndex]['tasks'].length;
      myGroups[groupIndex]['progress'] = ((completedTasks / totalTasks) * 100).round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: myGroups.length,
      onPageChanged: (int index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      itemBuilder: (context, index) {
        bool isCenter = index == _currentPageIndex;
        return Transform.scale(
          scale: isCenter ? 1.05 : 0.85,
          child: Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroupDetailPage(
                      title: myGroups[index]['title'],
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: isCenter
                    ? BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF3D00),
                      Color(0xFFFF9F6F)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(1),
                )
                    : BoxDecoration(
                  color: Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          myGroups[index]['title'],
                          style: TextStyle(
                            color: isCenter ? Colors.black : Colors.grey,
                            fontSize: 35,
                            fontFamily: 'Arimo-Bold',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${isCenter ? '${myGroups[index]['progress']}%' : "-"}',
                          style: TextStyle(
                            color: isCenter ? Colors.black : Colors.grey,
                            fontSize: 25,
                            fontFamily: 'Arimo-Bold',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: DynamicTaskView(
                        tasks: myGroups[index]['tasks'],
                        onUpdate: () => _updateProgress(index),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
