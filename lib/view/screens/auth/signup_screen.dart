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

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr: Colors.white,
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
                              text: 'Sign',
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              underLine: TextDecoration.none,
                            ),
                            TextUtils(
                              text: 'Up',
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
                          controller: nameController,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.name,
                          text: 'User Name',
                          obscureText: false,
                          prefixIcon: Get.isDarkMode
                              ? Icon(
                            Icons.person,
                            size: 30,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                          )
                              : Image.asset('assets/images/user.png'),
                          suffixIcon: const Text(''),
                        ),
                        const SizedBox(
                          height: 20,
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
                                color:
                                Get.isDarkMode ? pinkClr : mainColor,
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
                        const SizedBox(
                          height: 50,
                        ),
                        CheckWidget(),
                        const SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            text: 'SIGN UP',
                            width: 360,
                            onPressed: () {
                              if (controller.checkBox == false) {
                                Get.snackbar(
                                  'CheckBox',
                                  'Please, Accept terms & condition',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              } else if (formKey.currentState!.validate()) {
                                controller.signUpUsingFirebase(
                                  name: nameController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                );
                              }
                              controller.checkBox = true;
                            },
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Already have an Account?',
                textType: 'Sig In',
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
