import 'package:dart_week/modules/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> register(
      {required String name, required String email, required String password});

  Future<UserModel> login({required String email, required String password});
}
