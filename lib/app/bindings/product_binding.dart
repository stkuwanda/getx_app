import 'package:get/get.dart';
import 'package:getx_app/app/modules/products/controllers/product_controller.dart';
import 'package:getx_app/app/services/product_service.dart';

// This class is responsible for binding the ProductController to the ProductView. When the
// ProductView is navigated to, the dependencies defined in this binding will be injected,
// allowing the ProductController to be used within the ProductView. This is a key part of
// GetX's dependency management system, ensuring that controllers are properly instantiated
// and available when needed.
class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductService>(() => ProductService()); // Register ProductService as a lazy singleton, meaning it will only be created when it's first needed
    Get.lazyPut<ProductController>(() => ProductController(productService: Get.find<ProductService>())); // Register ProductController as a lazy singleton, and inject the ProductService dependency using Get.find to retrieve the instance of ProductService that was registered above
  }
}
