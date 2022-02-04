import 'package:dart_week/core/services/cart_products_service.dart';
import 'package:dart_week/models/product_model.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  final CartProductsService _cartService;

  ProductDetailController({required CartProductsService cartService})
      : _cartService = cartService;

  ProductModel get product => _product.value;

  final _quantity = 1.obs;
  final _total = 0.0.obs;
  final _alReadyAdded = false.obs;

  int get quantity => _quantity.value;
  double get total => product.price * quantity;
  bool get alReadyAdded => _alReadyAdded.value;

  @override
  void onInit() {
    final productShoppintCart = _cartService.getById(product.id);
    if (productShoppintCart != null) {
      _quantity(productShoppintCart.quantity);
      _alReadyAdded(true);
    }
    super.onInit();
  }

  void changeQuantity(int quantity) {
    _total(total * quantity);
    _quantity(quantity);
  }

  void addProductInShoppintgCart() {
    _cartService.addAndRemoveProdut(product: product, quantity: quantity);
    Get.back();
  }
}
