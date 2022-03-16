import 'package:e_commerce/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/setting_controller.dart';
import '../../../utils/themes.dart';
import '../text_utils.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: languageSettings,
                  ),
                  child: const Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextUtils(
                  text: 'Language'.tr,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                ),
              ],
            ),
          ),
          Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                width: 2,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                iconSize: 25,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                items: [
                  DropdownMenuItem(
                    child: Text(
                      english,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: ene,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      arabic,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: ara,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      france,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: frn,
                  ),
                ],
                value: controller.langLocal,
                onChanged: (typeLang){
                  controller.changeLanguage(typeLang!);
                  Get.updateLocale(Locale(typeLang),);
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
