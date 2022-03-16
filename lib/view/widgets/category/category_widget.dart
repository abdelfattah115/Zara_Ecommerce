import 'package:e_commerce/utils/themes.dart';

import '../../../logic/controller/category_controller.dart';
import 'category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);

  final controller = Get.find<CategoryController>();

  List<String> imageCategory = [
    'https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_.jpg',
    'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg',
    'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
    'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoadingCategory.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 15, left: 15),
                child: InkWell(
                  onTap: () {
                    controller.getCategoryIndex(index);
                    Get.to( ()=> CategoryItem(
                      categoryTitle: controller.categoryNameList[index],
                    ));
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(
                          imageCategory[index],
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 15),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          controller.categoryNameList[index],
                          style: const TextStyle(
                            backgroundColor: Colors.black38,
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: controller.categoryNameList.length,
            ),
          );
        }
      },
    );
  }
}
