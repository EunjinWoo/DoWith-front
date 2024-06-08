import 'package:dowith/screen/group_each_info/widgets/Body.dart';
import 'package:dowith/screen/group_each_info/widgets/Title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class eachGroupinfoPage extends StatelessWidget {
  final String title;
  eachGroupinfoPage({super.key, required this.title,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: -10,
      ),
      body: Column(
        children: [
          Expanded(
            child: eachGroupinfoPage_body(),
          ),
          eachGroupinfoPage_Title(title: title,),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
