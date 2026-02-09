import 'dart:convert';
import 'package:getx_app/app/modules/products/models/product_model.dart';
import 'package:http/http.dart' as http;

// Service class to handle fetching products from an API
class ProductService {
  static const String _baseUrl =
      'https://fakestoreapi.com'; // Base URL for the API

  static Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/products'),
    ); // Make a GET request to the API to fetch products

    // Check if the response is successful (status code 200) and parse the JSON data into a list
    // of ProductModel instances. If the response is not successful, throw an exception.
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
