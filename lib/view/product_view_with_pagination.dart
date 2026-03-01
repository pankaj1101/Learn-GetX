import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controllers/product_screen_controller.dart';
import 'package:learn_getx/view/cart_view.dart';

class ProductViewWithPagination extends StatelessWidget {
  ProductViewWithPagination({super.key});
  final prodController = Get.put(ProductScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Screen with Pagination'),
        actions: [
          Badge(
            label: Obx(() => Text(prodController.cartList.length.toString())),
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Get.to(() => CartView());
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
                  controller: prodController.scrollController,
                  itemCount:
                      prodController.productList.length +
                      (prodController.isLoadingMore.value ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < prodController.productList.length) {
                      final productItem = prodController.productList[index];

                      return ListTile(
                        leading: Image.network(productItem.images?[0] ?? ""),
                        title: Text(productItem.title ?? ""),
                        subtitle: Text(productItem.description ?? ""),
                        trailing: Text(productItem.price.toString()),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
