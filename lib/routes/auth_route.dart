import 'package:dart_week/modules/auth/login/login_page.dart';
import 'package:dart_week/modules/auth/register/register_page.dart';
import 'package:dart_week/routes/app_routes.dart';
import 'package:get/route_manager.dart';

class AuthRouter {
  static final routers = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
    )
  ];
}
