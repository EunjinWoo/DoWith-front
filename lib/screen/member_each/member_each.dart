import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class eachMemberPage extends StatelessWidget {
  final String title;
  eachMemberPage({super.key, required this.title,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        toolbarHeight: -10,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: _eachMemberPage_body(),
            ),
            _eachMemberPage_Title(title: title,),
          ],
        ),
      ),
    );
  }
}

class _eachMemberPage_Title extends StatelessWidget {
  final String title;
  const _eachMemberPage_Title({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 130,
      ),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Arimo-Bold',
            color: Colors.black,
            fontSize: 250,
          ),
        ),
      ),
    );
  }
}

class _eachMemberPage_body extends StatelessWidget {

  const _eachMemberPage_body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _eachMemberPage_body_top(),
          Expanded(child: _eachMemberPage_body_mid()),
          _eachMemberPage_body_bottom_info(),
        ],
      ),
    );
  }
}

class _eachMemberPage_body_top extends StatelessWidget {
  const _eachMemberPage_body_top({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Row(
        children: [
          _eachMemberPage_body_top_intro(),
          _eachMemberPage_body_top_members()
        ],
      ),
    );
  }
}

class _eachMemberPage_body_top_intro extends StatelessWidget {
  final String intro = 'Studying Algorithms From Baekjoon';
  const _eachMemberPage_body_top_intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
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

class _eachMemberPage_body_top_members extends StatelessWidget {
  final Map<String, int> members = {
    'Jimin' : 0,
    'Sun' : 0,
    'Eun' : 1,
    // 'Boo' : 0,
    // 'Han' : 1,
  };
  _eachMemberPage_body_top_members({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
          color: Color(0xFFFF3E01),
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double parentHeight = constraints.maxHeight;
                    return SingleChildScrollView(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 17),
                        constraints: BoxConstraints(
                          minHeight: parentHeight,
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double maxWidth = constraints.maxWidth;
                            double itemWidth = maxWidth / 2 - 35; // 아이템의 너비를 결정 (2열로 설정)
                            return Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 20,
                              runSpacing: 7,
                              children: members.keys.map((name) {
                                int profileStatus = members[name]!;
                                return Container(
                                  // color: Colors.black,
                                  width: itemWidth, // 각 항목의 너비를 설정 (간격 고려)
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: itemWidth * 0.5,
                                        backgroundImage: profileStatus == 1
                                            ? AssetImage('assets/img/profile_pic.jpeg')
                                            : null,
                                        backgroundColor: Colors.transparent,
                                        child: profileStatus == 0
                                            ? ClipOval(
                                          child: AspectRatio(
                                            aspectRatio: 1, // 정사각형 비율을 유지하도록 설정합니다.
                                            child: SvgPicture.asset(
                                              'assets/img/Orange_EmptyProfile.svg',
                                              fit: BoxFit.cover, // 이미지를 컨테이너에 꽉 채우도록 합니다.
                                              width: itemWidth, // CircleAvatar의 너비와 동일하게 설정
                                              height: itemWidth, // CircleAvatar의 높이와 동일하게 설정
                                            ),
                                          ),
                                        )
                                            : null,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        name,
                                        style: TextStyle(fontFamily: 'Arimo-SemiBold',fontSize: 13, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  '<members>',
                  style: TextStyle(
                    fontFamily: 'Arimo-Bold',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ]
          ),
        )
    );
  }
}

class _eachMemberPage_body_mid extends StatelessWidget {
  const _eachMemberPage_body_mid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

class _eachMemberPage_body_bottom_info extends StatelessWidget {
  const _eachMemberPage_body_bottom_info({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
    );
  }
}