// This file defines the routes used in the application. Each route is associated with a 
// specific view or page.'part of 'app_pages.dart'; means that this file is a part of the 
// 'app_pages.dart' file, which likely contains the overall routing configuration for the 
// application. The Routes class defines static constants for each route, making it easier 
// to manage and reference routes throughout the app. For example, when navigating to the 
// product details page, you can use Routes.PRODUCT_DETAILS instead of hardcoding the 
// string '/product-details'.
part of 'app_pages.dart'; 

abstract class Routes {
  static const product = '/product';
  static const product_details = '/product-details';
}