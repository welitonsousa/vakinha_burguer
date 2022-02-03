import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onChange;
  const AppRoundedButton({
    Key? key,
    required this.label,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onChange,
      child: Text(
        label,
        style: const TextStyle(color: Colors.grey, fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: const CircleBorder(),
      ),
    );
  }
}
