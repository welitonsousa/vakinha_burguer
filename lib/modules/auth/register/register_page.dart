import 'package:dart_week/core/ui/app_state.dart';
import 'package:dart_week/core/ui/widgets/app_appbar.dart';
import 'package:dart_week/core/ui/widgets/app_button.dart';
import 'package:dart_week/core/ui/widgets/app_text_form_field.dart';
import 'package:dart_week/modules/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask/mask.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends AppState<RegisterPage, RegisterController> {
  final _editName = TextEditingController();
  final _editEmail = TextEditingController();
  final _editPassword = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    _editEmail.dispose();
    _editName.dispose();
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
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro',
                  style: context.textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.primaryColorDark,
                  ),
                ),
                Text(
                  'Preencha os campos abaixo para criar o seu casdastro',
                  style: context.textTheme.bodyText1?.copyWith(
                    color: context.theme.primaryColorDark,
                  ),
                ),
                const SizedBox(height: 30),
                AppTextFormField(
                  label: 'Nome',
                  validator: Mask.validations.generic,
                  controller: _editName,
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  label: 'Email',
                  validator: Mask.validations.email,
                  controller: _editEmail,
                  enabled: !controller.loading,
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  label: 'Senha',
                  enabled: !controller.loading,
                  obcured: true,
                  validator: (value) => Mask.validations.generic(value, min: 6),
                  controller: _editPassword,
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  label: 'Confirme a senha',
                  enabled: !controller.loading,
                  validator: (value) => Mask.validations.generic(value, min: 6),
                  obcured: true,
                ),
                const SizedBox(height: 40),
                Obx(
                  () => AppButton(
                    label: 'Cadastrar',
                    wigth: context.width,
                    loading: controller.loading,
                    onPressed: () {
                      var validate = _form.currentState?.validate() ?? false;
                      if (validate) {
                        controller.registerUser(
                          name: _editName.text,
                          email: _editEmail.text,
                          password: _editPassword.text,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
