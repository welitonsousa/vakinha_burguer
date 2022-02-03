import 'package:dart_week/core/ui/app_state.dart';
import 'package:dart_week/modules/products/products_controller.dart';
import 'package:dart_week/modules/products/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends AppState<ProductsPage, ProdutsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => _body());
  }

  Widget _body() {
    if (controller.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: controller.products.length,
      itemBuilder: (context, index) {
        var product = controller.products[index];
        return ProductTile(product: product);
      },
    );
  }
}
