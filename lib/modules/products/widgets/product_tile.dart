import 'package:dart_week/core/formatters/formatters.dart';
import 'package:dart_week/core/ui/app_theme.dart';
import 'package:dart_week/models/product_model.dart';
import 'package:dart_week/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final prefixImage = 'http://dartweek.academiadoflutter.com.br/images';
  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.productDetail, arguments: product),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 90,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                child: Image.network(
                  '$prefixImage${product.image}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: AppTheme.textBold,
                  ),
                  Text(Formatters.money(product.price)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
