import 'package:dart_week/core/binding/aplication.dart';
import 'package:dart_week/core/ui/app_theme.dart';
import 'package:dart_week/routes/auth_route.dart';
import 'package:dart_week/routes/splash_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
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
        ...SplashRoute.routers,
        ...AuthRouter.routers,
      ],
    );
  }
}
