import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../utils/themes.dart';
import '../text_utils.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){
      return InkWell(
        splashColor: Get.isDarkMode ? pinkClr : mainColor,
        borderRadius: BorderRadius.circular(12),
        customBorder: const StadiumBorder() ,
        onTap: (){
          Get.defaultDialog(
            backgroundColor: Colors.grey[300],
            title: 'LogOut',
            titleStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            middleText: 'Are you sure you need to Logout?',
            middleTextStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textCancel: ' No ',
            cancelTextColor: Colors.black,
            textConfirm: ' yes ',
            confirmTextColor: Colors.black,
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              controller.signOutFormApp();
            },
            buttonColor: Get.isDarkMode ? pinkClr : mainColor,
            radius: 10,
          );
        },
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TextUtils(
                text: 'Logout'.tr,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                underLine: TextDecoration.none,
              ),
            ],
          ),
        ),
      );
    });
  }
}
