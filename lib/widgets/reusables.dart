//button

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//reusable flutter toast message

class ToastMessage {
  void showMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.CENTER,
      fontSize: 18,
      backgroundColor: Colors.green,
    );
  }
}

//reusable button
class ReusableButton extends StatelessWidget {
  const ReusableButton({
    super.key,
    required this.onTap,
    required this.btnName,
    this.btnColor = Colors.white30,
    this.borderColor = Colors.black54,
    required this.color,
  });
  final VoidCallback onTap;
  final String btnName;
  final Color btnColor;
  final Color borderColor;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
          height: height * 0.07,
          width: width * 0.80,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(10),
            color: btnColor,
          ),
          child: Center(
            child: Text(btnName,
                style: TextStyle(
                    color: color, fontSize: 20, fontWeight: FontWeight.w600)),
          )),
    );
  }
}
