import 'package:dart_week/core/constants/app_images.dart';
import 'package:dart_week/core/ui/widgets/app_button.dart';
import 'package:dart_week/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body(context),
        backgroundColor: const Color(0xFF140E0E),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            children: [
              SizedBox(height: context.heightTransformer(reducedBy: 85)),
              Image.asset(AppImages.logo),
              const SizedBox(height: 60),
              AppButton(
                wigth: context.widthTransformer(reducedBy: 40),
                label: 'ACESSAR',
                onPressed: () => controller.checkLogged(),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            child: Image.asset(AppImages.lanche, fit: BoxFit.cover),
            width: context.width,
          ),
        ),
      ],
    );
  }
}
