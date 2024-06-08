import 'package:flutter/material.dart';

class eachGroupinfoPage_body_bottom_info extends StatelessWidget {
  final String info;
  const eachGroupinfoPage_body_bottom_info({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 7,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'info',
                style: TextStyle(
                  fontFamily: 'Arimo-Medium',
                  color: Colors.black,
                  fontSize: 30,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    info,
                    style: TextStyle(
                      fontFamily: 'Arimo-Regular',
                      color: Colors.black,
                      fontSize: 13.5,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}