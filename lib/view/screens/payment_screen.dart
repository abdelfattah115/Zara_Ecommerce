import 'package:e_commerce/view/widgets/auth/auth_button.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/themes.dart';
import '../widgets/payment/delivery_container.dart';
import '../widgets/payment/payment_method.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text('Payment Screen'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: 'Shopping to',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                underLine: TextDecoration.none,
              ),
              const SizedBox(
                height: 20,
              ),
              const DeliveryContainerWidget(),
              const SizedBox(
                height: 20,
              ),
              TextUtils(
                text: 'Payment Method',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                underLine: TextDecoration.none,
              ),
              const SizedBox(
                height: 20,
              ),
              const PaymentMethodWidget(),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: TextUtils(
                  text: 'Total: 200\$',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: AuthButton(
                  text: 'Pay Now',
                  width: 150,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
