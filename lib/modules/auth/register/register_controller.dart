import 'package:dart_week/core/constants/app_storages.dart';
import 'package:dart_week/core/mixins/snack_mixins.dart';
import 'package:dart_week/core/rest_client/rest_client.dart';
import 'package:dart_week/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController with SnackMixin {
  final AuthRepository _authRepository;

  RegisterController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final _loading = false.obs;
  bool get loading => _loading.value;

  final _message = Rxn<MessageModel>();
  @override
  void onInit() {
    messageListener(_message);
    super.onInit();
  }

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading(true);
      final user = await _authRepository.register(
        name: name,
        email: email,
        password: password,
      );
      GetStorage().write(AppStorages.USER_ID, user.id);
      Get.back();
      _message(
        MessageModel(
          title: 'Sucesso',
          message: 'Usuário cadastrado com sucesso',
          type: MessageType.info,
        ),
      );
    } on RestClientException catch (e) {
      _message(
        MessageModel(
          title: 'Erro',
          message: e.message ?? 'Usuário não cadastrado',
          type: MessageType.error,
        ),
      );
    } finally {
      _loading(false);
    }
  }
}
