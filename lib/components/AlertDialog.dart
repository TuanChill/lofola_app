import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class AlertDialog {
  final String title;
  final String content;
  final DialogType dialogType;
  final AnimType animType;

  AlertDialog({
    required this.title,
    required this.content,
    this.dialogType = DialogType.info,
    this.animType = AnimType.scale,
  });

  @override
  AwesomeDialog build(BuildContext context) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: animType,
      title: title,
    );
  }
}
