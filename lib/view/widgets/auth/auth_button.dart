import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/themes.dart';
import '../text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final double width;
  final Function() onPressed;

  const AuthButton(
      {required this.text,
      required this.width,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode ? pinkClr : mainColor,
        minimumSize: Size(width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: TextUtils(
        text: text,
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        underLine: TextDecoration.none,
      ),
    );
  }
}
