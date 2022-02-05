import 'package:dart_week/models/order_model.dart';
import 'package:dart_week/models/pix_model.dart';

abstract class OrderRepository {
  Future<PixModel> createOrder(OrderModel order);
}
