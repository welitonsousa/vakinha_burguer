import 'package:dart_week/core/rest_client/rest_client.dart';
import 'package:dart_week/modules/models/user_model.dart';
import 'package:dart_week/modules/repositories/auth/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImp({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _restClient.post('/auth/register', {
      'email': email,
      'name': name,
      'password': password,
    });
    if (response.hasError) {
      throw RestClientException(response.body['error'] ?? '');
    }
    return login(email: email, password: password);
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _restClient.post('/auth/', {
      'email': email,
      'password': password,
    });
    if (response.hasError) {
      throw RestClientException(response.body);
    }

    return UserModel.fromMap(response.body);
  }
}
