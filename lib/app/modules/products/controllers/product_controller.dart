import 'package:get/get.dart';
import 'package:getx_app/app/modules/products/models/product_model.dart';
import 'package:getx_app/app/services/product_service.dart';

class ProductController extends GetxController {
  ProductController({required this.productService});

  var products = <ProductModel>[].obs;
  var errorMessage = ''.obs;
  var isLoading = false.obs;
  final ProductService productService;

  @override
  void onInit() {
    super.onInit();
    products.addAll([
      const ProductModel(title: 'Product 1', price: 10.0),
      const ProductModel(title: 'Product 2', price: 20.0),
      const ProductModel(title: 'Product 3', price: 30.0),
    ]);
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      errorMessage('');
      var productList = await productService.fetchProducts();
      products.assignAll(productList);
    } catch (e) {
      errorMessage('Failed to fetch products!');
    } finally {
      isLoading(false);
    }
  }
}
