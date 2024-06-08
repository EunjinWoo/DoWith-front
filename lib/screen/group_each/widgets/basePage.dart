import 'package:dowith/screen/group_each/util/basePage_GroupIntro.dart';
import 'package:dowith/screen/group_each/util/basePage_Title.dart';
import 'package:dowith/screen/group_each/util/basePage_TxtBtns.dart';
import 'package:flutter/material.dart';

class basePage extends StatelessWidget {
  final String title;
  final String groupIntro;
  final VoidCallback openShareModal;

  basePage({
    super.key,
    required this.title,
    required this.groupIntro,
    required this.openShareModal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          child: Transform.translate(
            offset: Offset(0,-15),
            child: Column( // title + txt btns
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                basePage_Title(title: title,), // title
                basePage_TxtBtns(title: title, openShareModal: openShareModal,), // txt btns
              ],
            ),
          ),
        ), // title + txt btns
        basePage_GroupIntro(groupIntro: groupIntro,), // group intro
      ],
    );
  }
}
