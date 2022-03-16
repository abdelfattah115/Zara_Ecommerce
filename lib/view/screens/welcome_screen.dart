import '../../routes/routes.dart';
import '../widgets/auth/auth_button.dart';
import '../widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/themes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/welcome.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: TextUtils(
                        text: 'Welcome',
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        underLine: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 220,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          text: 'Zara',
                          color: Get.isDarkMode ?  pinkClr: mainColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        TextUtils(
                          text: 'Shop',
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  AuthButton(
                    text: 'Get Start',
                    width: 170,
                    onPressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        text: 'Don\'t have an Account?',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        underLine: TextDecoration.none,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.signUpScreen);
                        },
                        child: TextUtils(
                          text: 'Sign Up',
                          color: Get.isDarkMode ?  pinkClr: mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          underLine: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
