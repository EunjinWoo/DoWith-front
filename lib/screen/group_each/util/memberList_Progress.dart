import 'package:flutter/material.dart';

class memberList_Progress extends StatelessWidget {
  final progress;
  const memberList_Progress({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${progress}%",
      style: TextStyle(
        fontSize: 20,
        fontFamily: 'Arimo-Bold',
        color: progress == 100 ? Color(0xFFFF5500) : Colors.black,
      ),
    );
  }
}