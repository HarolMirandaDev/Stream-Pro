import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_menu_nav_bar.dart';
import 'package:shop_app/enums.dart';

class PantallaClientes extends StatelessWidget {
  static String routeName = "/clientes";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Body(),
      bottomNavigationBar: CustomButtomNavBar(selectedMenu: MenuState.clientes),
    );
  }
}
