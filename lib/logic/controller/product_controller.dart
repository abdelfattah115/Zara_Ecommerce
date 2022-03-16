import 'package:e_commerce/services/product_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/product_model.dart';

class ProductController extends GetxController {
  var productsList = <ProductModels>[].obs;
  var favoritesList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();

  //search
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextEditing = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    List? storedShopping = storage.read<List>('isFavoriteList');
    if (storedShopping != null) {
      favoritesList =
          storedShopping.map((e) => ProductModels.fromJson(e)).toList().obs;
    }

    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productsList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavorites(int productId) async {
    var existingIndex =
        favoritesList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favoritesList.removeAt(existingIndex);
      await storage.remove('isFavoriteList');
    } else {
      favoritesList.add(
        productsList.firstWhere((element) => element.id == productId),
      );
      await storage.write('isFavoriteList', favoritesList);
    }
  }

  bool isFavorites(int productId) {
    return favoritesList.any((element) => element.id == productId);
  }

  void addSearchToList(String searchNamed) {
    searchNamed = searchNamed.toLowerCase();

    searchList.value = productsList.where((search) {
      var searchTitle = search.title.toLowerCase();
      return searchTitle.contains(searchNamed) ||
          search.price.toString().contains(searchNamed);
    }).toList();

    update();
  }
  void clearSearch(){
    searchTextEditing.clear();
    addSearchToList("");
  }
}
