import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/cart_controller.dart';
import '../../../utils/themes.dart';
import '../text_utils.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels models;
   AddCart({Key? key,required this.price, required this.models}) : super(key: key);

   var controller = Get.find<CartController>();
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
                  text: 'Price',
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                ),
                Text(
                  '\$ $price',
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
                    controller.addProductToCart(models);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        text: 'Add to Cart',
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        underLine: TextDecoration.none,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.shopping_cart_outlined),
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
