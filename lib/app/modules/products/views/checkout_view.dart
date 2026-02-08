import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/routes/app_pages.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Thank you for your purchase.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.product); // Navigate back to the product list and clear the navigation stack
              },
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
