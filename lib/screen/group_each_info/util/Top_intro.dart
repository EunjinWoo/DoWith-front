import 'package:flutter/material.dart';

class eachGroupinfoPage_body_top_intro extends StatelessWidget {
  final String intro = 'Studying Algorithms From Baekjoon';
  const eachGroupinfoPage_body_top_intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 10, top: 5, bottom: 5),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Intro',
                style: TextStyle(
                  fontFamily: 'Arimo-SemiBold',
                  color: Colors.black,
                  fontSize: 30,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                    intro,
                    style: TextStyle(
                      fontFamily: 'Arimo-Medium',
                      color: Colors.black,
                      fontSize: 15,
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}