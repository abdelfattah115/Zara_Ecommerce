
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utils/strings.dart';
import 'package:http/http.dart' as http;

class ProductServices{
  
 static Future <List<ProductModels>> getProduct() async{
  var response = await http.get(Uri.parse('$baseUrl/products'));
  
  if (response.statusCode == 200) {
   return productModelsFromJson(response.body);
  }  else{
   return throw Exception('Failed to load product');
  }
 }
}