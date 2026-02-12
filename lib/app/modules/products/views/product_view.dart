import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/modules/products/controllers/product_controller.dart';
import 'package:getx_app/app/routes/app_pages.dart';
import 'package:getx_app/app/services/theme_service.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});

  final ProductController productController = Get.find<ProductController>();

  final ThemeService _themeService = Get.find<ThemeService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('product_list'.tr),
      actions: [
        IconButton(
          icon: const Icon(Icons.language),
          onPressed: () {
            // Toggle between English and Spanish locales
            if (Get.locale?.languageCode == 'en') {
              Get.updateLocale(const Locale('es', 'ES'));
            } else {
              Get.updateLocale(const Locale('en', 'US'));
            }
          },
        ),
         IconButton(
          icon: const Icon(Icons.brightness_6),
          onPressed: () {
           _themeService.switchTheme(); // Toggle between light and dark themes using the ThemeService
          },
        ),
      ],), // Use .tr to translate the title based on the current locale
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: const CircularProgressIndicator());
        }

        if (productController.errorMessage.isNotEmpty) {
          return Center(child:  Text(productController.errorMessage.value));
        }

        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];
            return ListTile(
              title: Text(product.title),
              subtitle: Text('\$${product.price}'),
              onTap: () {
                Get.toNamed(
                  Routes.productDetails,
                  arguments: product,
                ); // Navigate to product details page with the selected product as an argument through the route name defined in Routes.productDetails
                // Get.to(() => ProductDetailsView(), arguments: product); --- IGNORE --- This is an alternative way to navigate to the product details page, but using Get.toNamed with the route name is more consistent with the routing setup in app_pages.dart
                // Get.off(() => ProductDetailsView(), arguments: product); --- IGNORE --- This would navigate to the product details page but also remove the current page from the navigation stack, which is not desired in this case as we want to be able to navigate back to the product list.
                // Get.offNamed(Routes.productDetails, arguments: product); --- IGNORE --- This would navigate to the product details page and remove the current page from the navigation stack, which is not desired in this case as we want to be able to navigate back to the product list.
                // Get.offAll(() => ProductDetailsView(), arguments: product); --- IGNORE --- This would navigate to the product details page and remove all previous pages from the navigation stack, which is not desired in this case as we want to be able to navigate back to the product list.
                // Get.offAllNamed(Routes.productDetails, arguments: product); --- IGNORE --- This would navigate to the product details page and remove all previous pages from the navigation stack, which is not desired in this case as we want to be able to navigate back to the product list.
              },
            );
          },
        );
      }), // Use Obx to reactively update the UI when products change
    );
  }
}
