import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/themes.dart';
import 'package:e_commerce/view/widgets/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text_utils.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            size: 150,
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text: 'Your Cart is ',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Empty',
                style: TextStyle(
                  color: Get.isDarkMode ? pinkClr : mainColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )),
          const SizedBox(
            height: 5,
          ),
          TextUtils(
            text: 'Add items to get started',
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            underLine: TextDecoration.none,
          ),
          const SizedBox(
            height: 50,
          ),
          AuthButton(
            text: 'Go to Home',
            width: 50,
            onPressed: () {
              Get.offNamed(Routes.mainScreen);
            },
          ),
        ],
      ),
    );
  }
}
