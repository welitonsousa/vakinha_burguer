import 'package:dart_week/core/services/auth_service.dart';
import 'package:dart_week/core/services/shopping_products_service.dart';
import 'package:dart_week/modules/order/cart_products/cart_products_bindings.dart';
import 'package:dart_week/modules/order/cart_products/cart_products_page.dart';
import 'package:dart_week/modules/products/products_binding.dart';
import 'package:dart_week/modules/products/products_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _pageIndex = 0.obs;
  final _tabs = ['/products', '/cart'];
  final ShopppingProductsService _shoppintCartService;

  HomeController({required ShopppingProductsService shoppintCartService})
      : _shoppintCartService = shoppintCartService;

  String get initialRoute => '/products';
  static const navigatorKey = 1;
  int get shoppingCartQuantity => _shoppintCartService.products.length;

  set pageIndex(int index) {
    if (index != 2) {
      Get.toNamed(_tabs[index], id: navigatorKey);
      _pageIndex(index);
    } else {
      Get.find<AuthService>().logout();
    }
  }

  int get pageIndex => _pageIndex.value;

  Route? ongeneratedRoute(RouteSettings settings) {
    if (settings.name == '/products') {
      return GetPageRoute(
        settings: settings,
        page: () => const ProductsPage(),
        binding: ProdutsBinding(),
      );
    } else if (settings.name == '/cart') {
      return GetPageRoute(
        settings: settings,
        binding: CartProductsBindings(),
        page: () => CartProductsPage(),
      );
    }
  }
}
