import 'package:get/get.dart';
import 'package:getx_app/app/modules/products/controllers/cart_controller.dart';
// import 'package:getx_app/app/modules/products/controllers/product_controller.dart';

// This class is responsible for setting up the dependencies for the application using GetX's dependency injection system.
abstract class Dependencies {
  static void dependencies() {
    // Get.put(ProductController()); // Dependency injection for ProductController
    Get.put(CartController()); // Dependency injection for CartController
  }
}
