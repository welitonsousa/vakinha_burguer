import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  final double? wigth;
  final double heigth;
  final bool loading;
  final Color? color;
  const AppButton({
    Key? key,
    this.onPressed,
    this.wigth,
    this.heigth = 50,
    this.color,
    this.loading = false,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wigth,
      height: heigth,
      child: ElevatedButton(
        onPressed: () {
          if (onPressed != null && !loading) {
            onPressed!();
          }
        },
        child: Visibility(
          visible: loading,
          child: const CircularProgressIndicator(color: Colors.white),
          replacement: Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: color,
        ),
      ),
    );
  }
}
