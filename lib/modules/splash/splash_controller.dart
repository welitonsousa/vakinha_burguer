import 'package:dart_week/core/services/auth_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final _authService = AuthService();

  void checkLogged() {
    Get.putAsync(() => _authService.init());
  }
}
