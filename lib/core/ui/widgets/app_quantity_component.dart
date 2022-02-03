import 'package:dart_week/core/formatters/formatters.dart';
import 'package:flutter/material.dart';
import 'package:dart_week/core/ui/widgets/app_rounded_button.dart';

class AppQuantityComponent extends StatelessWidget {
  final double price;
  final bool updateTotal;
  final Function(int) changeQuantity;
  final quantity = ValueNotifier(1);

  AppQuantityComponent({
    Key? key,
    required this.price,
    required this.changeQuantity,
    this.updateTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppRoundedButton(
          label: '-',
          onChange: () {
            if (quantity.value > 1) {
              quantity.value -= 1;
            }
            changeQuantity(quantity.value);
          },
        ),
        ValueListenableBuilder(
          valueListenable: quantity,
          builder: (context, value, widget) {
            return Text('$value');
          },
        ),
        AppRoundedButton(
          label: '+',
          onChange: () {
            quantity.value += 1;
            changeQuantity(quantity.value);
          },
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ValueListenableBuilder(
            valueListenable: quantity,
            builder: (context, value, widget) {
              if (updateTotal) {
                return Text(Formatters.money(price * quantity.value));
              }
              return Text(Formatters.money(price));
            },
          ),
        ),
      ],
    );
  }
}
