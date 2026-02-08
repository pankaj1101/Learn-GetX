import 'dart:convert';

import 'package:http/http.dart';
import 'package:learn_getx/model/posts_model.dart';
import 'package:learn_getx/model/product_model.dart';

class ApiRespository {
  Future<List<Products>> getProductData() async {
    const String url = "https://dummyjson.com/products";
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        // String - format - Convert
        final data = jsonDecode(response.body);
        final modelData = ProductResponseModel.fromJson(data);
        return modelData.products ?? [];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<List<PostsModel>> getPostData() async {
    const String url = "http://jsonplaceholder.typicode.com/posts";
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        // String - format - Convert
        List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => PostsModel.fromJson(item)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
