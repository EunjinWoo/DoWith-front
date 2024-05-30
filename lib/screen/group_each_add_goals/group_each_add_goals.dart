import 'package:flutter/material.dart';
import 'set_date.dart';

class eachGroupAddGoalsPage extends StatelessWidget {
  const eachGroupAddGoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: -10,
      ),
      body: Column(
        children: [
          SetDate(),
          _eachGroupAddGoalsPage_GroupGoals(),
          _eachGroupAddGoalsPage_MyGoals(),
        ],
      )
    );
  }
}

class _eachGroupAddGoalsPage_GroupGoals extends StatelessWidget {
  final List<String> groupGoals = [
    '73829',
    '38290',
    'Programmers - #27'
  ];
  _eachGroupAddGoalsPage_GroupGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Group goals',
                    style: TextStyle(
                      fontSize: 33,
                      fontFamily: 'Pretendard-Semibold',
                      decoration: TextDecoration.underline
                    ),
                  ),
                  Text(
                    '+',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Pretendard-Regular',
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: groupGoals.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Image.asset('assets/img/listDot_icon.png', height: 15,),
                        SizedBox(width: 10,),
                        Text(
                          groupGoals[index],
                          style: TextStyle(
                            fontFamily: 'Pretendard-Light',
                            fontSize: 19.5
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _eachGroupAddGoalsPage_MyGoals extends StatelessWidget {
  final List<String> groupGoals = [
    '알고리즘 과제',
  ];
  _eachGroupAddGoalsPage_MyGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My goals',
                    style: TextStyle(
                        fontSize: 33,
                        fontFamily: 'Pretendard-Semibold',
                        decoration: TextDecoration.underline
                    ),
                  ),
                  Text(
                    '+',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Pretendard-Regular',
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: groupGoals.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Image.asset('assets/img/listDot_icon.png', height: 15,),
                        SizedBox(width: 10,),
                        Text(
                          groupGoals[index],
                          style: TextStyle(
                              fontFamily: 'Pretendard-Light',
                              fontSize: 19.5
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}


