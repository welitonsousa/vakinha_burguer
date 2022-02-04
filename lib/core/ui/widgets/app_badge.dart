import 'package:dart_week/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class AppBadge extends StatelessWidget {
  final int quantity;
  final IconData icon;
  const AppBadge({Key? key, required this.quantity, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(icon),
        Visibility(
          visible: quantity > 0,
          child: Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              maxRadius: 9,
              backgroundColor: Colors.red,
              child: Text(
                quantity.toString(),
                style: AppTheme.textBold.copyWith(fontSize: 10),
              ),
            ),
          ),
        )
      ],
    );
  }
}
