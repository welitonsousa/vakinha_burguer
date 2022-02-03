import 'package:dart_week/core/rest_client/rest_client.dart';
import 'package:dart_week/models/product_model.dart';
import 'package:dart_week/repositories/products/products_repository.dart';

class ProductsRepositoryImp implements ProductsRepository {
  final RestClient _restClient;

  ProductsRepositoryImp({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<ProductModel>> findAllProducts() async {
    final response = await _restClient.get('/products/');
    if (response.hasError) {
      throw RestClientException(response.body['error'] ?? '');
    }
    return response.body
        .map<ProductModel>((e) => ProductModel.fromMap(e))
        .toList();
  }
}
