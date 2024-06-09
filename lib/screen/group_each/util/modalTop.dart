import 'package:flutter/material.dart';

class modalTop extends StatelessWidget {
  final VoidCallback closeShareModal;

  const modalTop({super.key, required this.closeShareModal});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      height: 30,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: closeShareModal,
            child: Image.asset(
              'assets/img/close_btn.png',
              height: 17,
            ),
          ),
        ],
      ),
    );
  }
}