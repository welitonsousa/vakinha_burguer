import 'package:dart_week/core/rest_client/rest_client.dart';
import 'package:get/instance_manager.dart';

class AplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestClient>(() => RestClient(), fenix: true);
  }
}
