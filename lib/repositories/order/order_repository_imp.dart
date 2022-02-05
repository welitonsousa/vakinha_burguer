import 'package:dart_week/core/rest_client/rest_client.dart';
import 'package:dart_week/models/order_model.dart';
import 'package:dart_week/models/pix_model.dart';
import 'package:dart_week/repositories/order/order_repository.dart';

class OrderRepositoryImp implements OrderRepository {
  final RestClient _restClient;

  OrderRepositoryImp({required RestClient restClient})
      : _restClient = restClient;
  @override
  Future<PixModel> createOrder(OrderModel order) async {
    final response = await _restClient.post('/order/', order.toMap());
    if (response.hasError) {
      throw 'Erro ao realizar pedido';
    }
    return PixModel.fromMap(response.body);
  }
}
