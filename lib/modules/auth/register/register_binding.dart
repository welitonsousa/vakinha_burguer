import 'package:dart_week/modules/auth/register/register_controller.dart';
import 'package:dart_week/repositories/auth/auth_repository.dart';
import 'package:dart_week/repositories/auth/auth_repository_imp.dart';
import 'package:get/instance_manager.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() {
      return AuthRepositoryImp(restClient: Get.find());
    });
    Get.lazyPut<RegisterController>(() {
      return RegisterController(authRepository: Get.find());
    });
  }
}
