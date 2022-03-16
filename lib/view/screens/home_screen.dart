import '../../utils/themes.dart';
import '../widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/home/card_items.dart';
import '../widgets/home/search_form_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? darkGreyClr : mainColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20.0,
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: 'Find Your'.tr,
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    underLine: TextDecoration.none,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextUtils(
                    text: 'INSPIRATION'.tr,
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    underLine: TextDecoration.none,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   SearchFormText(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10,),
            child: TextUtils(
              text: 'Categories'.tr,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              underLine: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 20,),
          CardItems(),
        ],
      ),
    );
  }
}
