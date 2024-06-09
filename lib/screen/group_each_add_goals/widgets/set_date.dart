import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class SetDate extends StatefulWidget {
  final void Function(DateTimeRange?) selectWeek;

  SetDate({super.key, required this.selectWeek});

  @override
  SetDateState createState() => SetDateState();
}

class SetDateState extends State<SetDate> {
  DateTime? _selectedDay;
  DateTime? _focusedDay;
  DateTimeRange? _selectedWeek;
  DateTimeRange? _tempSelectedWeek;
  bool isCalendarOpen = false;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _tempSelectedWeek = DateTimeRange(
        start: selectedDay,
        end: selectedDay.add(Duration(days: 6)),
      );
    });
  }

  Future<void> _selectWeek(BuildContext context) async {
    setState(() {
      isCalendarOpen = true;
    });
    await showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TableCalendar(
                  firstDay: DateTime(2000),
                  lastDay: DateTime(2101),
                  focusedDay: _focusedDay ?? DateTime.now(),
                  selectedDayPredicate: (day) {
                    return _selectedDay != null &&
                        day.isAfter(_selectedDay!.subtract(Duration(days: 1))) &&
                        day.isBefore(_selectedDay!.add(Duration(days: 7)));
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setModalState(() {
                      _onDaySelected(selectedDay, focusedDay);
                    });
                  },
                  calendarStyle: CalendarStyle(
                    rangeHighlightColor: Color(0xFFFF3E01),
                    selectedTextStyle: TextStyle(color: Colors.white),
                    todayTextStyle: TextStyle(color: Colors.black),
                    todayDecoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Color(0xFFFF3E01),
                      shape: BoxShape.circle,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  calendarBuilders: CalendarBuilders(
                    rangeStartBuilder: (context, day, focusedDay) {
                      return Container(
                        margin: const EdgeInsets.all(6.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF3E01),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${day.day}',
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                    rangeEndBuilder: (context, day, focusedDay) {
                      return Container(
                        margin: const EdgeInsets.all(6.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF3E01),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${day.day}',
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                    withinRangeBuilder: (context, day, focusedDay) {
                      return Container(
                        margin: const EdgeInsets.all(6.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF3E01),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${day.day}',
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedWeek = _tempSelectedWeek;
                      widget.selectWeek(_selectedWeek);
                    });
                    Navigator.pop(context);
                    isCalendarOpen = false;
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontFamily: 'Pretendard-Medium',
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(height: 30,)
              ],
            );
          },
        );
      },
    ).whenComplete(() {
      setState(() {
        isCalendarOpen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () => _selectWeek(context),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(style: BorderStyle.solid)
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: IntrinsicWidth(
            child: Row(
              children: [
                isCalendarOpen ? Image.asset('assets/img/bottom_icon.png', height: 20,) : Image.asset('assets/img/front_icon.png', height: 20,),
                SizedBox(width: 5,),
                Text(
                  _selectedWeek != null
                      ? '${DateFormat('yyMMdd').format(_selectedWeek!.start)} - ${DateFormat('yyMMdd').format(_selectedWeek!.end)}'
                      : 'No week selected',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Pretendard-Regular'
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
