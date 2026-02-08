import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_app/app/modules/products/models/product_model.dart';

class CartService extends GetxService {
  final storage = GetStorage();
  var cartItems = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    List? storedCart = storage.read<List>('cartItems');

    if (storedCart != null) {
      cartItems.assignAll(storedCart.map((e) => ProductModel.fromJson(e)));
    }

    ever(cartItems, (_) {
      storage.write('cartItems', cartItems.map((e) => e.toJson()).toList());
    });
  }

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
