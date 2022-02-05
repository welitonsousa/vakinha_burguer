import 'package:dart_week/core/constants/app_images.dart';
import 'package:dart_week/core/ui/widgets/app_button.dart';
import 'package:dart_week/models/pix_model.dart';
import 'package:dart_week/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationPage extends StatelessWidget {
  final PixModel pix = Get.arguments;
  ConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            AppImages.vakinha,
            width: context.widthTransformer(reducedBy: 50),
            height: context.heightTransformer(reducedBy: 70),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Pedido realizado com sucesso, clique no botão abaixo para acessar o QRCode do PIX',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.theme.primaryColorDark,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          AppButton(
            label: 'PIX',
            color: context.theme.primaryColorDark,
            wigth: context.widthTransformer(reducedBy: 40),
            onPressed: () => Get.toNamed(
              AppRoutes.pixConfirmation,
              arguments: pix,
            ),
          ),
          const Spacer(),
          AppButton(
            label: 'FECHAR',
            wigth: context.widthTransformer(reducedBy: 10),
            onPressed: () => Get.offAllNamed(AppRoutes.home),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
