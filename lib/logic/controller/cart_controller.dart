import 'package:e_commerce/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productMap = {}.obs;

  void addProductToCart(ProductModels models) {
    if (productMap.containsKey(models)) {
      productMap[models] += 1;
    } else {
      productMap[models] = 1;
    }
  }

  void removeProductFromCart(ProductModels models) {
    if (productMap.containsKey(models) && productMap[models] == 1) {
      productMap.removeWhere((key, value) => key == models);
    } else {
      productMap[models] -= 1;
    }
  }

  void removeOneProduct(ProductModels models) {
    productMap.removeWhere((key, value) => key == models);
  }

  void clearAllProduct() {
    productMap.clear();
  }

  get productSubTotal => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList();

  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productMap.isEmpty) {
      return 0;
    } else {
      return productMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
