// import 'package:get/get.dart';
// import 'package:getx_app/app/modules/products/controllers/cart_controller.dart';
// import 'package:getx_app/app/modules/products/controllers/product_controller.dart';
import 'package:get_storage/get_storage.dart';

// This class is responsible for setting up the dependencies for the application using GetX's dependency injection system.
abstract class Dependencies {
  static Future<void> dependencies() async {
    // Get.put(ProductController()); // Dependency injection for ProductController
    // Get.put(CartController()); // Dependency injection for CartController
    await GetStorage.init(); // Initialize GetStorage for local storage management
  }
}
