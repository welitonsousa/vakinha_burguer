import 'package:dart_week/modules/auth/login/login_controller.dart';
import 'package:dart_week/repositories/auth/auth_repository.dart';
import 'package:dart_week/repositories/auth/auth_repository_imp.dart';
import 'package:get/instance_manager.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() {
      return AuthRepositoryImp(restClient: Get.find());
    });
    Get.lazyPut<LoginController>(() {
      return LoginController(authRepository: Get.find());
    });
  }
}
