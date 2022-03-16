import 'package:e_commerce/utils/themes.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int groupValue = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          buildRadioPayment(
            title: 'Paypal',
            value: 1,
            image: 'assets/images/paypal.png',
            scale: 0.7,
            onChange: (value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
          const SizedBox(height: 15,),
          buildRadioPayment(
            title: 'Google pay',
            value: 2,
            image: 'assets/images/google.png',
            scale: 0.7,
            onChange: (value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
          const SizedBox(height: 15,),
          buildRadioPayment(
            title: 'Credit Card',
            value: 3,
            image: 'assets/images/credit.png',
            scale: 0.7,
            onChange: (value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String title,
    required int value,
    required Function onChange,
  }) =>
      Container(
        height: 50,
        width: double.infinity,
        color: Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  scale: scale,
                ),
                const SizedBox(
                  width: 10,
                ),
                TextUtils(
                  text: title,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                ),
              ],
            ),
            Radio(
              value: value,
              groupValue: groupValue,
              onChanged: (int? value) {
                onChange(value);
              },
              fillColor: MaterialStateColor.resolveWith(
                (states) => Get.isDarkMode ? pinkClr : mainColor,
              ),
            ),
          ],
        ),
      );
}
