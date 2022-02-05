import 'package:dart_week/core/mixins/snack_mixins.dart';
import 'package:dart_week/core/services/auth_service.dart';
import 'package:dart_week/core/services/shopping_products_service.dart';
import 'package:dart_week/models/order_model.dart';
import 'package:dart_week/models/shoppint_cart.dart';
import 'package:dart_week/modules/home/home_controller.dart';
import 'package:dart_week/repositories/order/order_repository.dart';
import 'package:dart_week/routes/app_routes.dart';
import 'package:get/get.dart';

class CartProductsController extends GetxController with SnackMixin {
  final ShopppingProductsService _shopppingProductsService;
  final OrderRepository _orderRepository;
  final AuthService _authService;

  CartProductsController({
    required ShopppingProductsService shopppingProductsService,
    required OrderRepository orderRepository,
    required AuthService authService,
  })  : _shopppingProductsService = shopppingProductsService,
        _orderRepository = orderRepository,
        _authService = authService;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final _cpf = ''.obs;
  final _address = ''.obs;

  bool get loading => _loading.value;
  String get cpf => _cpf.value;
  String get address => _address.value;

  set cpf(String value) => _cpf(value);
  set address(String value) => _address(value);

  List<ShoppintCartModel> get shoppintProducts =>
      _shopppingProductsService.products;

  double get totalCart => _shopppingProductsService.totalShoppingCart;

  void cleanCart() {
    _shopppingProductsService.cleanCart();
  }

  void changeQuantity(ShoppintCartModel product, int quantity) {
    _shopppingProductsService.addAndRemoveProdut(
        product: product.product, quantity: quantity);
  }

  Future<void> createOrder() async {
    try {
      _loading(true);
      final pix = await _orderRepository.createOrder(
        OrderModel(
          userId: _authService.userId!,
          cpf: cpf,
          address: address,
          items: _shopppingProductsService.products,
        ),
      );
      cleanCart();
      Get.offNamed(AppRoutes.shoppingConfirmation, arguments: pix);
      Get.back(id: HomeController.navigatorKey);
    } catch (e) {
      _message(MessageModel(
        message: 'Erro ao realizar pedido',
        title: 'Erro',
        type: MessageType.error,
      ));
    } finally {
      _loading(false);
    }
  }
}
