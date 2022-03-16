import 'package:e_commerce/logic/controller/category_controller.dart';

import '../../../logic/controller/cart_controller.dart';
import '../../../logic/controller/product_controller.dart';
import '../../../models/product_model.dart';
import '../../../utils/themes.dart';
import '../../screens/details_screen.dart';
import '../text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  final String categoryTitle;
  CategoryItem({Key? key, required this.categoryTitle,}) : super(key: key);

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        elevation: 0,
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      body: Obx(() {
        if (categoryController.isAllCategoryLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: categoryController.categoryList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
            ),
            itemBuilder: (context, index) {
              return buildCardItems(
                image: categoryController.categoryList[index].image,
                price: categoryController.categoryList[index].price,
                rate: categoryController.categoryList[index].rating.rate,
                productId: categoryController.categoryList[index].id,
                models: categoryController.categoryList[index],
                onTap: () => Get.to(
                  DetailsScreen(
                    models: categoryController.categoryList[index],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
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
                          cartController.addProductToCart(models);
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
