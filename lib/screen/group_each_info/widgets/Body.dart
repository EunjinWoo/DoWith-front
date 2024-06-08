import 'package:dowith/screen/group_each_info/util/Bottom.dart';
import 'package:dowith/screen/group_each_info/util/Mid.dart';
import 'package:dowith/screen/group_each_info/util/Top.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class eachGroupinfoPage_body extends StatefulWidget {
  const eachGroupinfoPage_body({super.key});

  @override
  _eachGroupinfoPage_bodyState createState() => _eachGroupinfoPage_bodyState();
}

class _eachGroupinfoPage_bodyState extends State<eachGroupinfoPage_body> {
  late Future<Map<String, dynamic>> groupInfo;

  @override
  void initState() {
    super.initState();
    groupInfo = fetchGroupInfo();
  }

  Future<Map<String, dynamic>> fetchGroupInfo() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:80/group/get/1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      return data;
    } else {
      throw Exception('Failed to load group info');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: groupInfo,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No data found'));
        } else {
          final data = snapshot.data!;
          return Container(
            child: Column(
              children: [
                eachGroupinfoPage_body_top(intro: data['group_intro']),
                Flexible(flex: 7, child: eachGroupinfoPage_body_mid()),
                eachGroupinfoPage_body_bottom_info(info: data['group_info']),
              ],
            ),
          );
        }
      },
    );
  }
}
