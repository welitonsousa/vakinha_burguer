import 'package:dart_week/modules/auth/login/login_binding.dart';
import 'package:dart_week/modules/auth/login/login_page.dart';
import 'package:dart_week/modules/auth/register/register_binding.dart';
import 'package:dart_week/modules/auth/register/register_page.dart';
import 'package:dart_week/routes/app_routes.dart';
import 'package:get/route_manager.dart';

class AuthRoute {
  static final routers = [
    GetPage(
      name: AppRoutes.login,
      binding: LoginBinding(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.register,
      binding: RegisterBinding(),
      page: () => const RegisterPage(),
    )
  ];
}
