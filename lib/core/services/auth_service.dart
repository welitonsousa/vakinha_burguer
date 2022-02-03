import 'package:dart_week/core/constants/app_storages.dart';
import 'package:dart_week/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  void logout() => _getStorage.write(AppStorages.USER_ID, null);
  int? get userId => _getStorage.read(AppStorages.USER_ID);

  Future<AuthService> init() async {
    _getStorage.listenKey(AppStorages.USER_ID, (value) {
      _isLogged(value != null);
    });
    ever<bool?>(_isLogged, (isLogged) {
      if (isLogged == null || !isLogged) {
        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.offAllNamed(AppRoutes.home);
      }
    });
    _isLogged(userId != null);
    return this;
  }
}
