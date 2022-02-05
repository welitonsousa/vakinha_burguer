import 'package:dart_week/core/ui/app_state.dart';
import 'package:dart_week/core/ui/widgets/app_appbar.dart';
import 'package:dart_week/core/ui/widgets/app_badge.dart';
import 'package:dart_week/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends AppState<PageHome, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(),
      backgroundColor: const Color(0XFFE5E5E5),
      bottomNavigationBar: Obx(() => _bottomNavigationBar()),
      body: _body(),
    );
  }

  Widget _body() {
    return Navigator(
      key: Get.nestedKey(HomeController.navigatorKey),
      initialRoute: controller.initialRoute,
      onGenerateRoute: controller.ongeneratedRoute,
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: controller.pageIndex,
      onTap: (index) => controller.pageIndex = index,
      items: [
        const BottomNavigationBarItem(
          label: 'Produtos',
          icon: Icon(Icons.list),
        ),
        BottomNavigationBarItem(
          label: 'Carrinho',
          icon: Obx(() => AppBadge(
                quantity: controller.shoppingCartQuantity,
                icon: Icons.shopping_cart_outlined,
              )),
        ),
        const BottomNavigationBarItem(
          label: 'Sair',
          icon: Icon(Icons.exit_to_app),
        )
      ],
    );
  }
}
