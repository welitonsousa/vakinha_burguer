import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/services/cart_products_service.dart';

class CartProductsPage extends GetView<CartProductsService> {
  const CartProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartProductsPage'),
      ),
      body: Container(),
    );
  }
}
