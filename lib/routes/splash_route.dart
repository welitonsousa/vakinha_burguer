import 'package:dart_week/modules/splash/splash_page.dart';
import 'package:dart_week/routes/app_routes.dart';
import 'package:get/route_manager.dart';

class SplashRoute {
  static List<GetPage<dynamic>> routers = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
  ];
}
