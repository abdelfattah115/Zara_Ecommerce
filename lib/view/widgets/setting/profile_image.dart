import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text_utils.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(
                 authController.displayUserPhoto.value,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: controller
                      .capitalize(authController.displayUserName.value),
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                ),
                TextUtils(
                  text: authController.displayUserEmail.value,
                  color: Get.isDarkMode ? Colors.white70 : Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  underLine: TextDecoration.none,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
