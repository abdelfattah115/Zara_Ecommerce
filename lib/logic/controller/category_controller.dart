import '../../models/product_model.dart';
import '../../services/category_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isLoadingCategory = false.obs;
  var categoryList = <ProductModels>[].obs;
  var isAllCategoryLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  void getCategories() async {
    var categories = await CategoryServices.getCategory();

    try {
      isLoadingCategory(true);
      if (categories.isNotEmpty) {
        categoryNameList.addAll(categories);
      }
    } finally {
      isLoadingCategory(false);
    }
  }

  getAllCategories(String categoryNames) async {
    isAllCategoryLoading(true);
    categoryList.value =
        await CategoryAllServices.getAllCategory(categoryNames);

    isAllCategoryLoading(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategories(categoryNameList[index]);
    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }

  }
}
