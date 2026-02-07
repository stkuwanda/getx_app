import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/modules/products/controllers/cart_controller.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('cart')),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];

                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('\$${item.price}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => cartController.removeFromCart(item),
                    ),
                  );
                },
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total: \$${cartController.totalAmount.value.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
