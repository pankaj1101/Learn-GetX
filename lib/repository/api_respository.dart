import 'dart:convert';

import 'package:http/http.dart';
import 'package:learn_getx/model/product_model.dart';

class ProductRespository {
  Future<List<Products>> getProductData() async {
    const String url = "https://dummyjson.com/products";
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // String - format - Convert
        final modelData = ProductResponseModel.fromJson(data);
        return modelData.products ?? [];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
