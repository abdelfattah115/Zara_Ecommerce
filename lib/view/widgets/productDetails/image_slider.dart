import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utils/themes.dart';
import 'package:e_commerce/view/widgets/productDetails/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  final String imageUrl;

  ImageSlider({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController carouselController = CarouselController();
  final controller = Get.find<CartController>();
  int currentPage = 0;
  int currentColor = 0;
  ProductModels? models;

  final List<Color> colorSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor1,
    kCOlor2,
    kCOlor3,
  ];

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.imageUrl),
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
          options: CarouselOptions(
              height: 450,
              autoPlay: true,
              viewportFraction: 1,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 2),
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              }),
        ),
        Positioned(
          bottom: 30,
          left: 180,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              dotColor: Colors.black,
              activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
            ),
          ),
        ),
        Positioned(
          right: 30,
          bottom: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentColor = index;
                    });
                  },
                  child: ColorPicker(
                    color: colorSelected[index],
                    outerBorder: currentColor == index,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 3,
              ),
              itemCount: colorSelected.length,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? pinkClr.withOpacity(0.8)
                        : mainColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
              Obx((){
                return Badge(
                  position: BadgePosition.topEnd(top: -10, end: -10),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    controller.quantity().toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? pinkClr.withOpacity(0.8)
                            : mainColor.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
