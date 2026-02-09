import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/modules/products/controllers/cart_controller.dart';
import 'package:getx_app/app/routes/app_pages.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('checkout'.tr)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('thank_you'.tr),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final cartController =
                    Get.find<
                      CartController
                    >(); // Retrieve the CartController instance using GetX's dependency injection
                cartController.cartItems.clear(); // Clear the cart items

                Get.snackbar(
                  'order_placed'.tr,
                  'order_success'.tr,
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.blueAccent,
                  colorText: Colors.white,
                );

                Get.offAllNamed(
                  Routes.product,
                ); // Navigate back to the product list and clear the navigation stack
              },
              child:  Text('go_to_home'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
