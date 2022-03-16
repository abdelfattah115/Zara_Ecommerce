import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utils/themes.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  final ProductModels models;
  final int index;
  final int quantity;

  CartProductCard(
      {required this.models,
      required this.index,
      required this.quantity,
      Key? key})
      : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 5,
      ),
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? pinkClr.withOpacity(0.7)
            : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 5,
              bottom: 5,
              left: 10,
            ),
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  models.image,
                ),

              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  models.title,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextUtils(
                  text: '\$ ${controller.productSubTotal[index].toStringAsFixed(2)}',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductFromCart(models);
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                    ),
                  ),
                  TextUtils(
                    text: '$quantity',
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    underLine: TextDecoration.none,
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addProductToCart(models);
                    },
                    icon: const Icon(
                      Icons.add_circle,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProduct(models);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
