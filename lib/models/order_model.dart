import 'dart:convert';
import 'package:dart_week/models/shoppint_cart.dart';

class OrderModel {
  int userId;
  String cpf;
  String address;
  List<ShoppintCartModel> items;

  OrderModel({
    required this.userId,
    required this.cpf,
    required this.address,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'cpf': cpf,
      'address': address,
      'items': items.map((shopping) {
        return {
          'quantity': shopping.quantity,
          'productId': shopping.product.id,
        };
      }).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
