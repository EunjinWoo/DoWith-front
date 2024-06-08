import 'package:flutter/material.dart';

class eachGroupinfoPage_body_bottom_info extends StatelessWidget {
  final String info = 'Good luck with your job. 🥹\n\nUpload a plan every week\nA fine of 30,000 won if less than 80% is not met\nA fine of 10,000 won for not uploading the plan\n\n🧾 Account: Hana Bank 000-000-0000000 Woo Eunjin';
  const eachGroupinfoPage_body_bottom_info({super.key});

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