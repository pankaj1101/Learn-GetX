import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controllers/product_screen_controller.dart';
import 'package:learn_getx/widgets/product_card.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final prodController = Get.put(ProductScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart Screen')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => prodController.cartList.isEmpty
              ? Center(
                  child: Text(
                    'No record\nPlease add some item in cart',
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.builder(
                  itemCount: prodController.cartList.length,
                  itemBuilder: (context, index) {
                    final productItem = prodController.cartList[index];

                    return ProductCard(
                      isProductScreen: false,
                      imageUrl: productItem['imageUrl'],
                      name: productItem['name'],
                      description: productItem['description'],
                      price: productItem['price'],
                      rating: productItem['rating'],
                      removeFromCart: () {
                        prodController.removeToCart(productItem);
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}
