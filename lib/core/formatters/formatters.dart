import 'package:flutter/material.dart';
import 'package:mask/mask.dart';

class Formatters {
  static String money(double value) {
    value = value * 10;
    final newValue = TextEditingValue(text: value.toString());
    final mask = Mask.money();
    return mask.formatEditUpdate(const TextEditingValue(), newValue).text;
  }
}
