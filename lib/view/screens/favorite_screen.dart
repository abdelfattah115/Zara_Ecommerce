import '../../logic/controller/product_controller.dart';
import '../../utils/themes.dart';
import '../widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (controller.favoritesList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'assets/images/heart.png',
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextUtils(
                  text: 'Please, Add your favorites products',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                ),
              ],
            ),
          );
        } else {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildFavItem(
              image: controller.favoritesList[index].image,
              title: controller.favoritesList[index].title,
              price: controller.favoritesList[index].price,
              productId: controller.favoritesList[index].id,
            ),
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey[300],
              indent: 30,
              endIndent: 30,
            ),
            itemCount: controller.favoritesList.length,
          );
        }
      }),
    );
  }

  Widget buildFavItem({
    required String image,
    required double price,
    required String title,
    required int productId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        height: 120,
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 120,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                controller.manageFavorites(productId);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
