import 'package:get/get.dart';
import 'package:getx_app/app/modules/products/models/product_model.dart';
import 'package:getx_app/app/services/cart_service.dart';

class CartController extends GetxController {
  final cartService =
      Get.find<
        CartService
      >(); // Retrieve the CartService instance using GetX's dependency injection

  List<ProductModel> get cartItems => cartService
      .cartItems; // Get the list of items in the cart from the CartService

  double get totalAmount => cartService
      .totalAmount; // Get the total amount of the items in the cart from the CartService

  // Method to add a product to the cart, which calls the corresponding method in the CartService
  void addToCart(ProductModel product) {
    cartService.addToCart(product);
  }

  // Method to remove a product from the cart, which calls the corresponding method in the CartService
  void removeFromCart(ProductModel product) {
    cartService.removeFromCart(product);
  }
}
