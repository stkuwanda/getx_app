import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/modules/products/controllers/cart_controller.dart';
import 'package:getx_app/app/modules/products/models/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({super.key});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        Get.arguments; // Retrieve the product passed as an argument

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/cart');
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.name, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text('\$${product.price}', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cartController.addToCart(product);
                Get.snackbar('Added to cart', '${product.name} added to your cart');
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
