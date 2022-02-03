import 'package:dart_week/models/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> findAllProducts();
}
