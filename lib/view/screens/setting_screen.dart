import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/utils/themes.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/theme_controller.dart';
import '../widgets/setting/dark__mode_widget.dart';
import '../widgets/setting/language_widget.dart';
import '../widgets/setting/logout_widget.dart';
import '../widgets/setting/profile_image.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            ProfileImage(),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            TextUtils(
              text: 'GENERAL'.tr,
              color: Get.isDarkMode ? pinkClr : mainColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              underLine: TextDecoration.none,
            ),
            const SizedBox(
              height: 20,
            ),
            DarkModeWidget(),
            const SizedBox(
              height: 20,
            ),
            LanguageWidget(),
            const SizedBox(
              height: 20,
            ),
            LogOutWidget(),

          ],
        ),
      ),
    );
  }
}
