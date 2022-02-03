import 'package:dart_week/modules/products/products_binding.dart';
import 'package:dart_week/modules/products/products_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String get initialRoute => '/products';
  int get navigatorKey => 1;

  final _pageIndex = 0.obs;
  final _tabs = ['/products', '/cart'];

  set pageIndex(int index) {
    Get.toNamed(_tabs[index], id: navigatorKey);
    _pageIndex(index);
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
        page: () => const ProductsPage(),
        binding: ProdutsBinding(),
      );
    }
  }
}
