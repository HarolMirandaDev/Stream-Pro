import 'package:flutter/material.dart';
import 'package:stream_pro/components/custom_menu_nav_bar.dart';
import 'file:///C:/Users/Alone/AndroidStudioProjects/Stream-Pro/lib/config/enums.dart';

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
