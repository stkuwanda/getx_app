import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_app/app/modules/products/models/product_model.dart';

class CartService extends GetxService {
  final storage = GetStorage();
  var cartItems = <ProductModel>[].obs;

  void addToCart(ProductModel product) {
    cartItems.add(product);
  }

  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
  }

  void clearCart() {
    cartItems.clear();
  }

  double get totalAmount =>
      cartItems.fold(0.0, (sum, item) => sum + item.price);
}
