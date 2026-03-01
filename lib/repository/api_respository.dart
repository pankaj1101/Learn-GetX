import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:learn_getx/core/api_endpoints.dart';
import 'package:learn_getx/model/posts_model.dart';
import 'package:learn_getx/model/product_model.dart';

class ApiRespository {
  Future<ProductResponseModel> getProductData({
    int size = 0,
    int limit = 10,
  }) async {
    final String url = "${ApiEndpoints.products}?skip=$size&limit=$limit";
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        // String - format - Convert
        final data = jsonDecode(response.body);
        final modelData = ProductResponseModel.fromJson(data);
        return modelData;
      } else {
        return ProductResponseModel();
      }
    } catch (e) {
      debugPrint('line 21 :: Error $e');
      return ProductResponseModel();
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
