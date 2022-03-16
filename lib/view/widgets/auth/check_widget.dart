import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/utils/themes.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.showCheckBox();
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.checkBox
                  ? Get.isDarkMode
                      ? Icon(
                          Icons.done,
                          size: 30,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        )
                      : Image.asset('assets/images/check.png')
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          TextUtils(
            text: 'I accept ',
            color: Get.isDarkMode ? Colors.white : Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            underLine: TextDecoration.none,
          ),
          TextUtils(
            text: 'terms & conditions',
            color: Get.isDarkMode ? Colors.white : Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            underLine: TextDecoration.underline,
          ),
        ],
      );
    });
  }
}
