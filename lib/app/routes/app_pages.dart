// This file defines the routes used in the application. Each route is associated with a 
// specific view or page. 'part 'app_routes.dart'; means that this file is a part of the 
// 'app_pages.dart' file, which likely contains the overall routing configuration for the 
// application. The Routes class defines static constants for each route, making it 
// easier to manage and reference routes throughout the app. For example, when navigating 
// to the product details page, you can use Routes.PRODUCT_DETAILS instead of hardcoding 
// the string '/product-details'.

import 'package:get/get.dart';
import 'package:getx_app/app/modules/products/views/product_details_view.dart';
import 'package:getx_app/app/modules/products/views/product_view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.product; // Define the initial route of the application

  static final routes = [
    GetPage(
      name: Routes.product,
      page: () => ProductView(), // Associate the PRODUCTS route with the ProductView
    ),
    GetPage(
      name: Routes.product_details,
      page: () => ProductDetailsView(), // Associate the PRODUCT_DETAILS route with the ProductDetailsView
    ),
  ];
}