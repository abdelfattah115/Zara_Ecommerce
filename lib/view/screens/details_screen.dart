import '../../models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/productDetails/add_cart.dart';
import '../widgets/productDetails/clothes_info.dart';
import '../widgets/productDetails/image_slider.dart';
import '../widgets/productDetails/size_list.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModels models;

  const DetailsScreen({Key? key, required this.models}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(imageUrl: models.image),
              ClothesInfo(
                title: models.title,
                productId: models.id,
                rate: models.rating.rate,
                description: models.description,
              ),
              const SizeList(),
              AddCart(
                models: models,
                price: models.price,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
