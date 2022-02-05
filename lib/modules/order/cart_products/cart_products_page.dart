import 'package:dart_week/core/formatters/formatters.dart';
import 'package:dart_week/core/ui/widgets/app_button.dart';
import 'package:dart_week/core/ui/widgets/app_quantity_component.dart';
import 'package:dart_week/core/ui/widgets/app_text_form_field.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mask/mask.dart';
import './cart_products_controller.dart';

class CartProductsPage extends GetView<CartProductsController> {
  CartProductsPage({Key? key}) : super(key: key);
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  Widget _cartComponent(BuildContext context) {
    return Row(
      children: [
        Text(
          'Carrinho',
          style: context.textTheme.headline5?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: controller.cleanCart,
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
        )
      ],
    );
  }

  Widget _produtsList(BuildContext context) {
    final list = controller.shoppintProducts;
    return Column(
      children: list
          .map((p) => Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, blurRadius: 2),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: context.widthTransformer(reducedBy: 80),
                      child: Text(
                        p.product.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Expanded(
                      child: AppQuantityComponent(
                        price: p.product.price,
                        minValue: 0,
                        initialQuantity: p.quantity,
                        updateTotal: true,
                        changeQuantity: (quantity) {
                          controller.changeQuantity(p, quantity);
                        },
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget _totalComponent(BuildContext context) {
    return Obx(() => ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Total do pedido', style: context.textTheme.bodyText1),
          trailing: Text(
            Formatters.money(controller.totalCart),
            style: context.textTheme.bodyText1,
          ),
        ));
  }

  Widget _buttonFinish(BuildContext context) {
    return Obx(() => AppButton(
        label: 'FINALIZAR',
        wigth: context.widthTransformer(reducedBy: 10),
        loading: controller.loading,
        onPressed: () {
          final validate = _form.currentState?.validate() ?? false;
          if (validate) {
            controller.createOrder();
          }
        }));
  }

  Widget _body(BuildContext context) {
    return Obx(() => Visibility(
          visible: controller.totalCart > 0,
          replacement: Center(
            child: Text(
              'Carrinho vazio',
              textAlign: TextAlign.center,
              style: context.textTheme.headline4,
            ),
          ),
          child: Form(
            key: _form,
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                _cartComponent(context),
                _produtsList(context),
                _totalComponent(context),
                const Divider(),
                const SizedBox(height: 20),
                AppTextFormField(
                  label: 'Endereço',
                  enabled: !controller.loading,
                  validator: Mask.validations.generic,
                  onChange: (value) => controller.address = value,
                ),
                const SizedBox(height: 10),
                AppTextFormField(
                  label: 'CPF',
                  enabled: !controller.loading,
                  onChange: (value) => controller.cpf = value,
                  validator: Mask.validations.cpf,
                ),
                const SizedBox(height: 10),
                _buttonFinish(context)
              ],
            ),
          ),
        ));
  }
}
