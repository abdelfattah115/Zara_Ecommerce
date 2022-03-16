import 'package:e_commerce/utils/strings.dart';
import 'package:http/http.dart' as http;

import '../models/category_model.dart';
import '../models/product_model.dart';

class CategoryServices{

  static Future <List<String>> getCategory() async{
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      return categoryModelFromJson(response.body);
    }  else{
      return throw Exception('Failed to load product');
    }
  }
}

class CategoryAllServices{

  static Future <List<ProductModels>> getAllCategory(String categoryNames) async{
    var response = await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));

    if (response.statusCode == 200) {
      return productModelsFromJson(response.body);
    }  else{
      return throw Exception('Failed to load product');
    }
  }
}