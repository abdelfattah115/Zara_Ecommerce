import 'package:e_commerce/logic/controller/product_controller.dart';
import 'package:e_commerce/utils/themes.dart';
import 'package:e_commerce/view/widgets/productDetails/size_list.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import 'add_cart.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;

  ClothesInfo({
    Key? key,
    required this.title,
    required this.productId,
    required this.rate,
    required this.description,
  }) : super(key: key);

  var controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Obx(() {
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.9)
                        : Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavorites(productId);
                    },
                    child: controller.isFavorites(productId)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 20,
                          ),
                  ),
                );
              }),
            ],
          ),
          Row(
            children: [
              TextUtils(
                text: '$rate',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                underLine: TextDecoration.none,
              ),
              const SizedBox(
                width: 5,
              ),
              RatingBarIndicator(
                rating: rate,
                itemCount: 5,
                itemSize: 20,
                unratedColor: Colors.grey,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemPadding: const EdgeInsets.all(1),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimLength: 10,
            trimMode: TrimMode.Line,
            trimCollapsedText: '...Read more',
            trimExpandedText: ' Less',
            moreStyle:  TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
