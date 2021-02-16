import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_menu_nav_bar.dart';
import 'package:shop_app/enums.dart';

import 'components/cuerpo_cuentas.dart';

class PantallaCuentas extends StatelessWidget {
  static String routeName = "/cuentas";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomButtomNavBar(selectedMenu: MenuState.cuentas),
    );
  }
}
