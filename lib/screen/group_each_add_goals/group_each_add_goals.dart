import 'package:dowith/screen/group_each_add_goals/widgets/GroupGoals.dart';
import 'package:dowith/screen/group_each_add_goals/widgets/MyGoals.dart';
import 'package:dowith/screen/group_each_add_goals/widgets/set_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class eachGroupAddGoalsPage extends StatefulWidget {
  const eachGroupAddGoalsPage({super.key});

  @override
  State<eachGroupAddGoalsPage> createState() => _eachGroupAddGoalsPageState();
}

class _eachGroupAddGoalsPageState extends State<eachGroupAddGoalsPage> {
  DateTimeRange? selectedWeek;

  void set_selectedWeek(DateTimeRange? range) {
    setState(() {
      selectedWeek = range;
      // print('week : $selectedWeek');
      // print('start : ${DateFormat('yyMMdd').format(selectedWeek!.start)}');
      // print('end : ${DateFormat('yyMMdd').format(selectedWeek!.end)}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: (){Navigator.pop(context);},
          child: Container(
            padding: EdgeInsets.all(15.0), // 여백을 추가하여 이미지가 더 작아보이도록 할 수 있습니다
            child: Image.asset('assets/img/back_icon.png',),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SetDate(selectWeek: set_selectedWeek),
              eachGroupAddGoalsPage_GroupGoals(selectedWeek: selectedWeek),
              eachGroupAddGoalsPage_MyGoals(selectedWeek: selectedWeek),
            ],
          ),
          Container(height: 30, color: Color(0xFFFD531E),)
        ],
      )
    );
  }
}

