import 'package:dart_week/core/ui/widgets/app_appbar.dart';
import 'package:dart_week/core/ui/widgets/app_button.dart';
import 'package:dart_week/core/ui/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(elevation: 0),
      backgroundColor: Colors.white,
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
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
                const AppTextFormField(label: 'Nome'),
                const SizedBox(height: 20),
                const AppTextFormField(label: 'Email'),
                const SizedBox(height: 20),
                const AppTextFormField(
                  label: 'Senha',
                  obcured: true,
                ),
                const SizedBox(height: 20),
                const AppTextFormField(
                  label: 'Confirme a senha',
                  obcured: true,
                ),
                const SizedBox(height: 40),
                AppButton(
                  label: 'Cadastrar',
                  onPressed: () {},
                  wigth: context.width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
