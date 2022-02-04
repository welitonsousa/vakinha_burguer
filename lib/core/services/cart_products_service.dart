import 'package:dart_week/models/product_model.dart';
import 'package:dart_week/models/shoppint_cart.dart';
import 'package:get/get.dart';

class CartProductsService extends GetxService {
  final _shoppingCart = <int, ShoppintCartModel>{}.obs;

  List<ShoppintCartModel> get products => _shoppingCart.values.toList();

  ShoppintCartModel? getById(int id) => _shoppingCart[id];

  void addAndRemoveProdut({
    required ProductModel product,
    required int quantity,
  }) {
    if (quantity == 0) {
      _shoppingCart.remove(product.id);
    } else {
      _shoppingCart.update(product.id, (product) {
        product.quantity = quantity;
        return product;
      }, ifAbsent: () {
        return ShoppintCartModel(quantity: quantity, product: product);
      });
    }
  }
}
