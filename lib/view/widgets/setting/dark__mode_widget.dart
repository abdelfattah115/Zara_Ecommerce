import 'package:e_commerce/logic/controller/setting_controller.dart';
import 'package:e_commerce/utils/themes.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/theme_controller.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Switch(
            activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
            activeColor: Get.isDarkMode ? pinkClr : mainColor,
            value: controller.switchValue.value,
            onChanged: (value) {
              ThemeController().changeThemeData();
              controller.switchValue.value = value;
            },
          ),
        ],
      ),
    );
  }

  Widget buildIconWidget() => Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: darkSettings,
              ),
              child: const Icon(
                Icons.dark_mode,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            TextUtils(
              text: 'Dark Mode'.tr,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              underLine: TextDecoration.none,
            ),
          ],
        ),
      );
}
