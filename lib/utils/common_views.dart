import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:oktoast/oktoast.dart' as toast;
enum TBAlertType { success, info, warning, error, chat, none }

class CommonViews {


  void showToast(BuildContext context, String message,
      {bool isShort = true,
        TBAlertType type = TBAlertType.info,
        ToastPosition gravity = ToastPosition.center}) {
    Color backgroundColor = Colors.green;

    switch (type) {
      case TBAlertType.success:
        backgroundColor = Colors.green;
        break;
      case TBAlertType.info:
        backgroundColor = Colors.green;
        break;
      case TBAlertType.warning:
        backgroundColor = Colors.green;
        break;
      case TBAlertType.error:
        backgroundColor = Colors.red;
        break;
      case TBAlertType.chat:
        break;
      case TBAlertType.none:
        break;
    }

    toast.showToast(
      message,
      position: gravity,
      backgroundColor: backgroundColor,
      radius: 13.0,
      duration: const Duration(seconds: 5),
      textStyle: TextStyle(fontSize: 14, color: Colors.white),
      animationBuilder: const Miui10AnimBuilder(),
    );
  }
}