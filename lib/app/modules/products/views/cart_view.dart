import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/modules/products/controllers/cart_controller.dart';
import 'package:getx_app/app/routes/app_pages.dart';

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
                      //onPressed: () => cartController.removeFromCart(item),
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'Remove item',
                          middleText:
                              'Are you sure you want to remove ${item.name} from the cart?',
                          textConfirm: 'Yes',
                          textCancel: 'No',
                          confirmTextColor: Colors.white,
                          onConfirm: () {
                            cartController.removeFromCart(item);
                            Get.back(); // Close the dialog after removing the item
                          },
                        );
                      },
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
          ElevatedButton(
            onPressed: () {
              Get.toNamed(
                Routes.checkout,
              ); // Navigate to the checkout page when the button is pressed
            },
            child: const Text('Proceed to Checkout'),
          ),
        ],
      ),
    );
  }
}
