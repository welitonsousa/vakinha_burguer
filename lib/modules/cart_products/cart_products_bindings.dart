import 'package:dart_week/core/services/cart_products_service.dart';
import 'package:get/get.dart';

class CartProductsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CartProductsService());
  }
}
