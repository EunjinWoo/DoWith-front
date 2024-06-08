import 'package:flutter/material.dart';

class memberList_Todos extends StatelessWidget {
  const memberList_Todos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Column 내부의 내용을 중앙 정렬
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('73829',
          style: TextStyle(
            fontFamily: 'Arimo-Regular',
            fontSize: 11,
            color: key == 'Jimin' ? Color(0xFF8B8B8B) : Colors.black,
            decoration: key == 'Jimin' ? TextDecoration.lineThrough : TextDecoration.none,
            decorationColor: key == 'Jimin' ? Color(0xFF8B8B8B) : Colors.black,
          ),
        ), // 추가 정보
        Text('38290',
          style: TextStyle(
            fontFamily: 'Arimo-Regular',
            fontSize: 11,
            color: key != 'Eun' ? Color(0xFF8B8B8B) : Colors.black,
            decoration: key != 'Eun' ? TextDecoration.lineThrough : TextDecoration.none,
            decorationColor: key != 'Eun' ? Color(0xFF8B8B8B) : Colors.black,
          ),
        ), // 추가 정보
        Text('Programmers-#27',
          style: TextStyle(
            fontFamily: 'Arimo-Regular',
            fontSize: 11,
            color: Color(0xFF8B8B8B),
            decoration: TextDecoration.lineThrough,
            decorationColor: Color(0xFF8B8B8B),
          ),
        ), // 추가 정보
      ],
    );
  }
}