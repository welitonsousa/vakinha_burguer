import 'package:dart_week/repositories/order/order_repository.dart';
import 'package:dart_week/repositories/order/order_repository_imp.dart';
import 'package:get/get.dart';
import './cart_products_controller.dart';

class CartProductsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<OrderRepository>(
      OrderRepositoryImp(restClient: Get.find()),
    );
    Get.put(CartProductsController(
      shopppingProductsService: Get.find(),
      authService: Get.find(),
      orderRepository: Get.find(),
    ));
  }
}
