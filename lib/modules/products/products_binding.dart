import 'package:dart_week/modules/products/products_controller.dart';
import 'package:dart_week/repositories/products/products_repository.dart';
import 'package:dart_week/repositories/products/products_repository_imp.dart';
import 'package:get/get.dart';

class ProdutsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsRepository>(
      () => ProductsRepositoryImp(restClient: Get.find()),
    );
    Get.lazyPut<ProdutsController>(
      () => ProdutsController(productsRepository: Get.find()),
    );
  }
}
