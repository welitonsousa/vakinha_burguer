import 'package:dart_week/modules/home/home_binding.dart';
import 'package:dart_week/modules/home/home_page.dart';
import 'package:dart_week/routes/app_routes.dart';
import 'package:get/route_manager.dart';

class HomeRoute {
  static final routers = [
    GetPage(
      name: AppRoutes.home,
      binding: HomeBinding(),
      page: () => const PageHome(),
    )
  ];
}
