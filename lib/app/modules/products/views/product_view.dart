import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/modules/products/controllers/product_controller.dart';
import 'package:getx_app/app/routes/app_pages.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});

  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Obx(
        () => ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
              onTap: () => Get.toNamed(
                Routes.productDetails,
                arguments: product,
              ), // Navigate to product details page
            );
          },
        ),
      ), // Use Obx to reactively update the UI when products change
    );
  }
}
