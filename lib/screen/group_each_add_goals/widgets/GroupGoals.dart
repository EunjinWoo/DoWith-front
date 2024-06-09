import 'package:flutter/material.dart';

class eachGroupAddGoalsPage_GroupGoals extends StatefulWidget {
  final DateTimeRange? selectedWeek;

  eachGroupAddGoalsPage_GroupGoals({super.key, required this.selectedWeek});

  @override
  State<eachGroupAddGoalsPage_GroupGoals> createState() => eachGroupAddGoalsPage_GroupGoalsState();
}

class eachGroupAddGoalsPage_GroupGoalsState extends State<eachGroupAddGoalsPage_GroupGoals> {
  final List<String> groupGoals = [
    '73829',
    '38290',
    'Programmers - #27'
  ];
  final List<String> groupGoals_null = [];

  bool addingGoals = false;
  final TextEditingController _newGoalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _newGoalController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _newGoalController.dispose();
    super.dispose();
  }

  void _showORhideAddGoalSpace () {
    setState(() {
      addingGoals = !addingGoals;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('Group : ${widget.selectedWeek}');

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
                  GestureDetector(
                    onTap: _showORhideAddGoalSpace,
                    child: Text(
                      addingGoals ? '-' : '+',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Pretendard-Regular',
                        color: addingGoals ? Color(0xFFFD531E) : Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              if (addingGoals) Row(
                children: [
                  Image.asset('assets/img/Orange_listDot_icon.png', height: 15,),
                  SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      controller: _newGoalController,
                      style: TextStyle(
                          fontFamily: 'Pretendard-Light',
                          fontSize: 19.5
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none, // 테두리 제거
                        enabledBorder: InputBorder.none, // 활성 상태 테두리 제거
                        focusedBorder: InputBorder.none, // 포커스 상태 테두리 제거
                        hintText: '', // 힌트 텍스트 제거
                        labelText: null, // 라벨 텍스트 제거
                        contentPadding: EdgeInsets.all(0), // 내부 여백 제거
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: _showORhideAddGoalSpace,
                    child: Image.asset('assets/img/Orange_checkmark_icon.png', height: 25,),
                  ),
                  SizedBox(width: 5,),
                  GestureDetector(
                      onTap: _showORhideAddGoalSpace,
                      child: Image.asset('assets/img/Orange_cancle_icon.png', height: 25,)
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: (widget.selectedWeek != null) ? groupGoals.length : groupGoals_null.length,
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