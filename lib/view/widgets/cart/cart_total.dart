import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/routes/routes.dart';

import '../text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/themes.dart';

class CartTotal extends StatelessWidget {
   CartTotal({Key? key}) : super(key: key);

   final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: 'Total',
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                ),
                Text(
                  '\$ ${controller.total}',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.paymentScreen);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        text: 'Check Out',
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        underLine: TextDecoration.none,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.shopping_cart),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Get.isDarkMode ? pinkClr : mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
