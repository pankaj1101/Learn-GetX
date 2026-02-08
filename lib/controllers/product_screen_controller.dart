import 'package:get/state_manager.dart';
import 'package:learn_getx/model/product_model.dart';
import 'package:learn_getx/repository/api_respository.dart';

class ProductScreenController extends GetxController {
  RxList<Products> productList = <Products>[].obs;
  final productRepo = ProductRespository();

  @override
  Future<void> onInit() async {
    super.onInit();
    productList.value = await productRepo.getProductData();
    // await Future.delayed(Duration(milliseconds: 2000));
    // productList.value = productData
    //     .map((item) => Products.fromJson(item))
    //     .toList();
  }

  RxList<Map<String, dynamic>> cartList = <Map<String, dynamic>>[].obs;

  void addToCart(Map<String, dynamic> item) {
    cartList.value = [...cartList, item];
  }

  void removeToCart(Map<String, dynamic> item) {
    cartList.remove(item);
  }
}
