import 'package:dart_week/core/ui/app_state.dart';
import 'package:dart_week/core/ui/widgets/app_appbar.dart';
import 'package:dart_week/core/ui/widgets/app_button.dart';
import 'package:dart_week/core/ui/widgets/app_text_form_field.dart';
import 'package:dart_week/modules/auth/login/login_controller.dart';
import 'package:dart_week/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask/mask.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends AppState<LoginPage, LoginController> {
  final _editEmail = TextEditingController();
  final _editPassword = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    _editEmail.dispose();
    _editPassword.dispose();
    super.dispose();
  }

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
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: context.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark,
                      ),
                    ),
                    const SizedBox(height: 30),
                    AppTextFormField(
                      label: 'Email',
                      validator: Mask.validations.email,
                      controller: _editEmail,
                      enabled: !controller.loading,
                    ),
                    const SizedBox(height: 20),
                    AppTextFormField(
                      label: 'Senha',
                      obcured: true,
                      controller: _editPassword,
                      enabled: !controller.loading,
                      validator: (value) => Mask.validations.generic(
                        value,
                        min: 6,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Obx(
                      () => AppButton(
                        label: 'Entrar',
                        wigth: context.width,
                        loading: controller.loading,
                        onPressed: () {
                          final validator =
                              _form.currentState?.validate() ?? false;
                          if (validator) {
                            controller.loginUser(
                              email: _editEmail.text,
                              password: _editPassword.text,
                            );
                          }
                        },
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Não possuí uma conta?'),
                          TextButton(
                            onPressed: () => Get.toNamed(AppRoutes.register),
                            child: const Text('Cadastre-se'),
                          )
                        ],
                      ),
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
