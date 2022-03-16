import '../../../logic/controller/cart_controller.dart';
import '../../../logic/controller/product_controller.dart';
import '../../../models/product_model.dart';
import '../../../utils/themes.dart';
import '../../screens/details_screen.dart';
import '../text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  final controllerCart = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: controller.searchList.isEmpty &&
                  controller.searchTextEditing.text.isNotEmpty
              ? Get.isDarkMode
                  ? Image.asset('assets/images/search_empty_dark.png')
                  : Image.asset('assets/images/search_empty_light.png')
              : GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.searchList.isEmpty
                      ? controller.productsList.length
                      : controller.searchList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 6.0,
                  ),
                  itemBuilder: (context, index) {
                    if (controller.searchList.isEmpty) {
                      return buildCardItems(
                        image: controller.productsList[index].image,
                        price: controller.productsList[index].price,
                        rate: controller.productsList[index].rating.rate,
                        productId: controller.productsList[index].id,
                        models: controller.productsList[index],
                        onTap: () => Get.to(
                          DetailsScreen(
                            models: controller.productsList[index],
                          ),
                        ),
                      );
                    } else {
                      return buildCardItems(
                        image: controller.searchList[index].image,
                        price: controller.searchList[index].price,
                        rate: controller.searchList[index].rating.rate,
                        productId: controller.searchList[index].id,
                        models: controller.searchList[index],
                        onTap: () => Get.to(
                          DetailsScreen(
                            models: controller.searchList[index],
                          ),
                        ),
                      );
                    }
                  },
                ),
        );
      }
    });
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels models,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFavorites(productId);
                      },
                      icon: controller.isFavorites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                        onPressed: () {
                          controllerCart.addProductToCart(models);
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtils(
                      text: '\$ $price',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      underLine: TextDecoration.none,
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              text: '$rate',
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              underLine: TextDecoration.none,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 13,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
