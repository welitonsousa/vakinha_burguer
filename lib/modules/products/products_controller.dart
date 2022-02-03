import 'package:dart_week/core/mixins/snack_mixins.dart';
import 'package:dart_week/models/product_model.dart';
import 'package:dart_week/repositories/products/products_repository.dart';
import 'package:get/get.dart';

class ProdutsController extends GetxController with SnackMixin {
  final ProductsRepository _productRepository;

  ProdutsController({required ProductsRepository productsRepository})
      : _productRepository = productsRepository;

  final _produts = <ProductModel>[].obs;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  List<ProductModel> get products => _produts;
  bool get loading => _loading.value;

  Future<void> findAllProducts() async {
    try {
      final response = await _productRepository.findAllProducts();
      _produts.assignAll(response);
    } catch (e) {
      _message(MessageModel(
        message: 'Erro ao buscar produtos',
        title: 'Erro',
        type: MessageType.error,
      ));
    }
  }

  @override
  Future<void> onReady() async {
    _loading(true);
    await findAllProducts();
    _loading(false);
    super.onReady();
  }
}
