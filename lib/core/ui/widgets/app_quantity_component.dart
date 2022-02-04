import 'package:dart_week/core/formatters/formatters.dart';
import 'package:flutter/material.dart';
import 'package:dart_week/core/ui/widgets/app_rounded_button.dart';

class AppQuantityComponent extends StatefulWidget {
  final double price;
  final int initialQuantity;
  final bool updateTotal;
  final Function(int) changeQuantity;

  const AppQuantityComponent({
    Key? key,
    required this.price,
    required this.changeQuantity,
    this.initialQuantity = 1,
    this.updateTotal = false,
  }) : super(key: key);

  @override
  State<AppQuantityComponent> createState() => _AppQuantityComponentState();
}

class _AppQuantityComponentState extends State<AppQuantityComponent> {
  final quantity = ValueNotifier(1);

  @override
  void initState() {
    quantity.value = widget.initialQuantity;
    super.initState();
  }

  @override
  void dispose() {
    quantity.dispose();
    super.dispose();
  }

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
            widget.changeQuantity(quantity.value);
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
            widget.changeQuantity(quantity.value);
          },
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ValueListenableBuilder(
            valueListenable: quantity,
            builder: (context, value, _) {
              if (widget.updateTotal) {
                return Text(Formatters.money(widget.price * quantity.value));
              }
              return Text(Formatters.money(widget.price));
            },
          ),
        ),
      ],
    );
  }
}
