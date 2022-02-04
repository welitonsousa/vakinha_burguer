import 'package:get/get.dart';
import './product_detail_controller.dart';

class ProductDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ProductDetailController>(
      ProductDetailController(cartService: Get.find()),
    );
  }
}
