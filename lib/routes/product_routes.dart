import 'package:dart_week/modules/order/confirmation/confirmation_page.dart';
import 'package:dart_week/modules/order/pix/pix_page.dart';
import 'package:dart_week/modules/products/product_detail/product_detail_bindings.dart';
import 'package:dart_week/modules/products/product_detail/product_detail_page.dart';
import 'package:dart_week/routes/app_routes.dart';
import 'package:get/route_manager.dart';

class ProductRoute {
  static final List<GetPage> routers = [
    GetPage(
      name: AppRoutes.productDetail,
      binding: ProductDetailBindings(),
      page: () => const ProductDetailPage(),
    ),
    GetPage(
      name: AppRoutes.shoppingConfirmation,
      page: () => ConfirmationPage(),
    ),
    GetPage(
      name: AppRoutes.pixConfirmation,
      page: () => PixPage(),
    )
  ];
}
