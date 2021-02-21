import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_menu_nav_bar.dart';
import 'package:shop_app/enums.dart';

import 'components/cuerpo_usuario_perfil.dart';

class PantallaUsuario extends StatelessWidget {
  static String routeName = "/usuario";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuario"),
      ),
      body: Body(),

    );
  }
}
