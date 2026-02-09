import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/modules/products/controllers/cart_controller.dart';
import 'package:getx_app/app/modules/products/models/product_model.dart';
import 'package:getx_app/app/routes/app_pages.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({super.key});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        Get.arguments; // Retrieve the product passed as an argument

    return Scaffold(
      appBar: AppBar(
        title: Text('product_details'.tr), // Use .tr to translate the title based on the current locale
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.cart);
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     Get.back(); // Navigate back to the previous page
            //   },
            //   child: const Text('Back'),
            // ),
            Text(product.title, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text('\$${product.price}', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cartController.addToCart(product);

                // Show a snackbar to confirm that the product has been added to the cart
                // Get.snackbar(
                //   'Added to cart',
                //   '${product.name} added to your cart',
                //   duration: const Duration(seconds: 2),
                // );
                Get.snackbar(
                  'add_to_cart'.tr,
                  '${product.title} ${'added_to_cart'.tr}',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.blueAccent,
                  colorText: Colors.white,
                );
              },
              child:  Text('add_to_cart'.tr),
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    color: Colors.white,
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.shopping_cart),
                          title:  Text('view_cart'.tr),
                          onTap: () {
                            Get.toNamed(Routes.cart);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.payment),
                          title:  Text('proceed_to_checkout'.tr),
                          onTap: () {
                            Get.toNamed(Routes.checkout);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              child:  Text('more'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
