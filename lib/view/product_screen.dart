import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controllers/product_screen_controller.dart';
import 'package:learn_getx/view/cart_view.dart';
import 'package:learn_getx/widgets/product_card.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final prodController = Get.put(ProductScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Screen'),
        actions: [
          Badge(
            label: Obx(() => Text(prodController.cartList.length.toString())),
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Get.to(CartView());
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return CartView();
                //     },
                //   ),
                // );
                // Get.back(); -> Navigator.pop(context);
                // Get.snackbar('Success', 'Naviagated to cart Screen');
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text('Naviagated to cart Screen')),
                // );
                // Get.dialog(Text('Hello'));
              },
              icon: Icon(Icons.shopping_bag),
            ),
          ),
        ],
      ),
      body: Obx(
        () => prodController.productList.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: prodController.productList.length,
                  itemBuilder: (context, index) {
                    final productItem = prodController.productList[index];

                    return ProductCard(
                      imageUrl: productItem.imageUrl ?? "",
                      name: productItem.name ?? "",
                      description: productItem.description ?? "",
                      price: productItem.price ?? 0,
                      rating: productItem.rating ?? 0,
                      onAddToCart: () {
                        // prodController.addToCart(productItem);
                      },
                    );
                  },
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
