import 'package:e_commerce/utils/themes.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onPressed;

  const ContainerUnder(
      {required this.text,
      required this.textType,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration:  BoxDecoration(
        color: Get.isDarkMode? pinkClr : mainColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: text,
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            underLine: TextDecoration.none,
          ),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
              text: textType,
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              underLine: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
