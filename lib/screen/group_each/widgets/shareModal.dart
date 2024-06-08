import 'package:dowith/screen/group_each/util/modalBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class share_modal extends StatefulWidget {
  final VoidCallback closeShareModal;
  final String groupShareCode;

  const share_modal({super.key, required this.closeShareModal, required this.groupShareCode});

  @override
  State<share_modal> createState() => share_modalState();
}

class share_modalState extends State<share_modal> {
  bool isShareCodeCopied = false;

  void copy() {
    setState(() {
      Clipboard.setData(ClipboardData(text: widget.groupShareCode));
      isShareCodeCopied = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double mediaQuery = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: mediaQuery * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(2, 4),
              )
            ]
        ),
        child: IntrinsicHeight(
          child: Column(
            children: [
              modalTop(closeShareModal: widget.closeShareModal,),
              modalBody(
                groupShareCode: widget.groupShareCode,
                copy: copy,
                isShareCodeCopied: isShareCodeCopied,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
