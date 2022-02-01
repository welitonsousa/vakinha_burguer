import 'package:dart_week/core/ui/widgets/app_appbar.dart';
import 'package:dart_week/core/ui/widgets/app_button.dart';
import 'package:dart_week/core/ui/widgets/app_text_form_field.dart';
import 'package:dart_week/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(elevation: 0),
      backgroundColor: Colors.white,
      body: body(),
    );
  }

  Widget body() {
    return LayoutBuilder(builder: (context, contrains) {
      return ConstrainedBox(
        constraints: BoxConstraints(minHeight: contrains.maxHeight),
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Login',
                      style: context.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const AppTextFormField(label: 'Email'),
                    const SizedBox(height: 20),
                    const AppTextFormField(label: 'Senha', obcured: true),
                    const SizedBox(height: 40),
                    AppButton(
                      label: 'Entrar',
                      onPressed: () {},
                      wigth: context.width,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Não possuí uma conta?'),
                        TextButton(
                          onPressed: () => Get.toNamed(AppRoutes.register),
                          child: const Text('Cadastre-se'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
