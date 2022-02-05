import 'package:dart_week/models/product_model.dart';
import 'package:dart_week/models/shoppint_cart.dart';
import 'package:get/get.dart';

class ShopppingProductsService extends GetxService {
  final _shoppingCart = <int, ShoppintCartModel>{}.obs;

  List<ShoppintCartModel> get products => _shoppingCart.values.toList();
  void cleanCart() {
    _shoppingCart.clear();
  }

  double get totalShoppingCart {
    return _shoppingCart.values.fold(0, (total, cart) {
      total += cart.product.price * cart.quantity;
      return total;
    });
  }

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
