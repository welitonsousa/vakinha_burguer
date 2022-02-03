import 'package:dart_week/core/binding/aplication.dart';
import 'package:dart_week/core/ui/app_theme.dart';
import 'package:dart_week/routes/auth_route.dart';
import 'package:dart_week/routes/home_routes.dart';
import 'package:dart_week/routes/splash_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dart Week',
      theme: AppTheme.theme,
      initialBinding: AplicationBinding(),
      getPages: [
        ...HomeRoute.routers,
        ...SplashRoute.routers,
        ...AuthRoute.routers,
      ],
    );
  }
}
