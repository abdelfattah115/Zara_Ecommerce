import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/themes.dart';
import 'package:e_commerce/view/widgets/auth/auth_button.dart';
import 'package:e_commerce/view/widgets/auth/text_form_field.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../utils/strings.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/container_under.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr: Colors.white ,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    left: 25,
                    right: 25,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'LOG',
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              underLine: TextDecoration.none,
                            ),
                            TextUtils(
                              text: 'IN',
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              underLine: TextDecoration.none,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthTextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Enter valid email';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          text: 'Email',
                          obscureText: false,
                          prefixIcon: Get.isDarkMode
                              ? Icon(
                            Icons.email,
                            size: 30,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                          )
                              : Image.asset('assets/images/email.png'),
                          suffixIcon: const Text(''),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer or equal to 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.visiblePassword,
                              text: 'Password',
                              obscureText:
                                  controller.isVisibility ? false : true,
                              prefixIcon: Get.isDarkMode
                                  ? Icon(
                                Icons.lock,
                                size: 30,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                              )
                                  : Image.asset('assets/images/lock.png'),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.showVisibility();
                                },
                                icon: controller.isVisibility
                                    ? const Icon(
                                        Icons.visibility_off_outlined,
                                        size: 30,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility_outlined,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                              ));
                        }),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPasswordScreen);
                            },
                            child: TextUtils(
                              text: 'Forgot Password?',
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              underLine: TextDecoration.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            text: 'LOG IN',
                            width: 360,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                controller.logInUsingFirebase(
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                );
                              }
                            },
                          );
                        }),
                        const SizedBox(
                          height: 30,
                        ),
                        TextUtils(
                          text: 'OR',
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/facebook.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GetBuilder<AuthController>(builder: (_){
                              return InkWell(
                                onTap: () {
                                  controller.googleSignUpApp();
                                },
                                child: Image.asset(
                                  'assets/images/google.png',
                                  fit: BoxFit.cover,
                                ),
                              );
                            })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Don\'t have an Account?',
                textType: 'Sig up',
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
