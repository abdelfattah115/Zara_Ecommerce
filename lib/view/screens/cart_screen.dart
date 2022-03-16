import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/routes/routes.dart';

import '../../logic/controller/cart_controller.dart';
import '../../utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/cart/cart_product_card.dart';
import '../widgets/cart/cart_total.dart';
import '../widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart Screen'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.defaultDialog(
                  backgroundColor: Colors.grey[300],
                  title: 'Clear Products',
                  titleStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  middleText: 'Are you sure need clear Products',
                  middleTextStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textCancel: ' No ',
                  cancelTextColor: Colors.black,
                  textConfirm: ' yes ',
                  confirmTextColor: Colors.black,
                  onCancel: () {
                    Get.toNamed(Routes.cartScreen);
                  },
                  onConfirm: () {
                    controller.clearAllProduct();
                    Get.back();
                  },
                  buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  radius: 10,
                );
              },
              icon: const Icon(
                Icons.backspace,
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
        ),
        body: Obx(() {
          if (controller.productMap.isEmpty) {
            return EmptyCart();
          }  else{
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.separated(
                      itemBuilder: (context, index) => CartProductCard(
                        index: index,
                        models: controller.productMap.keys.toList()[index],
                        quantity: controller.productMap.values.toList()[index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: controller.productMap.length,
                    ),
                  ),
                  CartTotal(),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
