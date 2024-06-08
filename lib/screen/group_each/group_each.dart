import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dowith/screen/group_each/widgets/basePage.dart';
import 'package:dowith/screen/group_each/widgets/memberList.dart';
import 'package:dowith/screen/group_each/widgets/shareModal.dart';

class GroupDetailPage extends StatefulWidget {
  final String title;

  GroupDetailPage({required this.title});

  @override
  State<GroupDetailPage> createState() => _GroupDetailPageState();
}

class _GroupDetailPageState extends State<GroupDetailPage> {
  final Map<String, int> membersProgress = {
    'Jimin': 100,
    'Sun': 66,
    'Eun': 33,
  };

  bool isShareModalOpen = false;
  Map<String, dynamic>? groupData;
  String groupIntro = '';
  String groupUuid = '';

  @override
  void initState() {
    super.initState();
    fetchGroupData();
  }

  Future<void> fetchGroupData() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:80/group/get/1'));

    if (response.statusCode == 200) {
      setState(() {
        groupData = json.decode(response.body);
        groupIntro = groupData?['group_intro'] ?? groupIntro;
        groupUuid = groupData?['group_uuid'] ?? groupUuid;
      });
      print(groupData);
    } else {
      throw Exception('Failed to load group data');
    }
  }

  void _openShareModal() {
    setState(() {
      if (!isShareModalOpen) {
        isShareModalOpen = true;
      }
    });
  }

  void _closeShareModal() {
    setState(() {
      if (isShareModalOpen) {
        isShareModalOpen = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        toolbarHeight: -5,
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: _closeShareModal,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFF3D00),
                    Color(0xFFFF5602),
                    Color(0xFFFD864B),
                    Color(0xFFFCBA99),
                    Color(0xFFF9F9F9)
                  ],
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: basePage(
                      title: widget.title,
                      groupIntro: groupIntro,
                      openShareModal: _openShareModal,
                    ),
                  ),
                  memberList(membersProgress: membersProgress),
                ],
              ),
            ),
          ),
          if (isShareModalOpen)
            share_modal(
              closeShareModal: _closeShareModal,
              groupShareCode: groupUuid,
            ),
        ],
      ),
    );
  }
}
