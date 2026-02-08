import 'package:get/state_manager.dart';
import 'package:learn_getx/data/product_data.dart';
import 'package:learn_getx/model/product_model.dart';

class ProductScreenController extends GetxController {
  RxList<Products> productList = <Products>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(Duration(milliseconds: 2000));
    productList.value = productData
        .map((item) => Products.fromJson(item))
        .toList();
  }

  RxList<Map<String, dynamic>> cartList = <Map<String, dynamic>>[].obs;

  void addToCart(Map<String, dynamic> item) {
    cartList.value = [...cartList, item];
  }

  void removeToCart(Map<String, dynamic> item) {
    cartList.remove(item);
  }
}
