import '../widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/category/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: TextUtils(
                text: 'Category'.tr,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                underLine: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 10,),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
