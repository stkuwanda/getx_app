import 'package:get/get.dart';
import 'package:getx_app/app/modules/products/models/product_model.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    products.addAll([
      const ProductModel(name: 'Product 1', price: 10.0),
      const ProductModel(name: 'Product 2', price: 20.0),
      const ProductModel(name: 'Product 3', price: 30.0),
    ]);

    super.onInit();
  }
}
