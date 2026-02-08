import 'package:get/get.dart';
import 'package:getx_app/app/modules/products/controllers/cart_controller.dart';

// This class is responsible for binding the CartController to the CartView. When the CartView 
// is navigated to, the dependencies defined in this binding will be injected, allowing the Cart 
// Controller to be used within the CartView. This is a key part of GetX's dependency management 
// system, ensuring that controllers are properly instantiated and available when needed.
class CartBinding extends Bindings {
  @override
  void dependencies() {
    // lazyPut is different from put in that it will only create an instance of CartController 
    // when it is first requested, rather than immediately when the binding is initialized. 
    // This can help to improve performance by only creating instances of controllers when they 
    // are actually needed.
    Get.lazyPut<CartController>(() => CartController());
  }
}
