import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/model/product_model.dart';
import 'package:learn_getx/repository/api_respository.dart';

class ProductScreenController extends GetxController {
  final productRepo = ApiRespository();

  RxList<Products> productList = <Products>[].obs;
  RxList<Map<String, dynamic>> cartList = <Map<String, dynamic>>[].obs;

  ScrollController scrollController = ScrollController();

  int limit = 5;
  int skip = 0;
  int total = 0;

  RxBool isLoadingMore = false.obs;
  RxBool hasMore = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          !isLoadingMore.value &&
          hasMore.value) {
        fetchProducts();
      }
    });
  }

  Future<void> fetchProducts() async {
    try {
      isLoadingMore.value = true;
      final response = await productRepo.getProductData(
        size: skip,
        limit: limit,
      );
      total = response.total!.toInt();

      productList.addAll(response.products!);
      skip += limit;
      if (productList.length >= total) {
        hasMore.value = false;
      }

      await Future.delayed(Duration(milliseconds: 100));

      if (scrollController.hasClients &&
          scrollController.position.maxScrollExtent == 0 &&
          hasMore.value) {
        fetchProducts();
      }
    } catch (e) {
      debugPrint("Pagination Error: $e");
    } finally {
      isLoadingMore.value = false;
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
