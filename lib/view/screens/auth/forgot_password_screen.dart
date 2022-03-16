import 'package:e_commerce/logic/binding/auth_binding.dart';
import 'package:e_commerce/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../utils/strings.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  var controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        title: Text(
          'Forgot Password',
          style: TextStyle(
            color: Get.isDarkMode ? mainColor : pinkClr,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Get.isDarkMode ? Colors.black: Colors.white ,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close_outlined,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                      )),
                ),
                Text(
                  'if you want to recover your account, then please provide your email ID be Below..',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/forgetpass copy.png',
                  width: 250,
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
                      ? Image.asset('assets/images/email.png')
                      : const Icon(
                          Icons.email,
                          size: 30,
                          color: pinkClr,
                        ),
                  suffixIcon: const Text(''),
                ),
                const SizedBox(
                  height: 50,
                ),
                GetBuilder<AuthController>(builder: (_){
                  return AuthButton(
                    text: 'SEND',
                    width: 360,
                    onPressed: () {
                     if(formKey.currentState!.validate()){
                       controller.resetPassword(emailController.text.trim());
                     }
                    },
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
