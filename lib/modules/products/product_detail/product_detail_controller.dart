import 'package:dart_week/models/product_model.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  ProductModel get product => _product.value;

  final _quantity = 1.obs;
  final _total = 0.0.obs;

  int get quantity => _quantity.value;
  double get total => product.price * quantity;

  void changeQuantity(int quantity) {
    _total(total * quantity);
    _quantity(quantity);
  }
}
