import 'package:dart_week/core/formatters/formatters.dart';
import 'package:dart_week/core/ui/widgets/app_appbar.dart';
import 'package:dart_week/models/pix_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PixPage extends StatelessWidget {
  final PixModel pix = Get.arguments;
  final prefixImage = 'http://dartweek.academiadoflutter.com.br/images';

  PixPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppbar(),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                children: [
                  const Spacer(),
                  Text('Valor a receber', style: context.textTheme.headline6),
                  Text(Formatters.money(pix.totalValue),
                      style: context.textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                  Image.memory(Uri.parse(pix.image).data!.contentAsBytes()),
                  TextButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: pix.code));
                      Get.rawSnackbar(
                        snackPosition: SnackPosition.BOTTOM,
                        messageText: const Center(
                          child: Text(
                            'PIX COPIADO',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Copiar chave PIX',
                      style: TextStyle(
                        decorationStyle: TextDecorationStyle.dashed,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            )
          ],
        ));
  }
}
