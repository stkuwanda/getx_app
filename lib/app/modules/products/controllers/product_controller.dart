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
    fetchProducts();
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
