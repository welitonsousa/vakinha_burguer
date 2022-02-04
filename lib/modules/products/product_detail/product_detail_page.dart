import 'package:dart_week/core/formatters/formatters.dart';
import 'package:dart_week/core/ui/app_theme.dart';
import 'package:dart_week/core/ui/widgets/app_appbar.dart';
import 'package:dart_week/core/ui/widgets/app_button.dart';
import 'package:dart_week/core/ui/widgets/app_quantity_component.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);
  final prefixImage = 'http://dartweek.academiadoflutter.com.br/images';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return ListView(
      children: [
        Image.network(
          '$prefixImage${controller.product.image}',
          height: 300,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.product.name,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.headline4?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(controller.product.description),
              const SizedBox(height: 20),
              AppQuantityComponent(
                initialQuantity: controller.quantity,
                price: controller.product.price,
                changeQuantity: controller.changeQuantity,
              ),
              const Divider(),
              Obx(() => ListTile(
                    title: const Text("Total", style: AppTheme.textBold),
                    trailing: Text(Formatters.money(controller.total)),
                  )),
              const SizedBox(height: 20),
              AppButton(
                wigth: context.width,
                label: controller.alReadyAdded ? 'ATUALIZAR' : 'ADICIONAR',
                onPressed: controller.addProductInShoppintgCart,
              ),
            ],
          ),
        )
      ],
    );
  }
}
