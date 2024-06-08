import 'package:dowith/screen/group_each_info/util/Bottom.dart';
import 'package:dowith/screen/group_each_info/util/Mid.dart';
import 'package:dowith/screen/group_each_info/util/Top.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class eachGroupinfoPage_body extends StatelessWidget {

  const eachGroupinfoPage_body({super.key});

  Future<void> fetchGroupInfo() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:80/group/get/1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);  // 데이터 콘솔에 출력
    } else {
      throw Exception('Failed to load group info');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 그룹 정보를 받아오는 함수를 호출
    fetchGroupInfo();

    return Container(
      child: Column(
        children: [
          eachGroupinfoPage_body_top(),
          Flexible(flex: 7 ,child: eachGroupinfoPage_body_mid()),
          eachGroupinfoPage_body_bottom_info(),
        ],
      ),
    );
  }
}
