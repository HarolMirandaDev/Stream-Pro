import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stream_pro/components/custom_menu_nav_bar.dart';
import 'package:stream_pro/config/enums.dart';
import 'package:stream_pro/config/constants.dart';

import 'components/cuerpo_inicio.dart';

class PantallaInicio extends StatelessWidget {
  static String routeName = "/inicio";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/Icono Menu Inicio.svg",
          color: Colors.white
        ),
        onPressed: () =>
        null,
      ),

        title: Text("Stream Pro"),
        backgroundColor: Color(0xFF01579B),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 18),
        ),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu ),
            tooltip: 'Cerrar Sesión',
            onPressed: () {

            },
          ),
        ],
      ),

      body: Body(),
      bottomNavigationBar: CustomButtomNavBar(
          selectedMenu: MenuState.inicio
      ),
    );
  }
}
