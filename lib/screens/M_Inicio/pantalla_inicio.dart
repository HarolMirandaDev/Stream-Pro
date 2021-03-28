import 'package:flutter/material.dart';
import 'package:stream_pro/components/custom_menu_nav_bar.dart';
import 'package:stream_pro/config/enums.dart';

import 'components/cuerpo_inicio.dart';

class PantallaInicio extends StatelessWidget {
  static String routeName = "/inicio";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text("  Stream Pro"),
        backgroundColor: Color(0xFF01579B),
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 20),
        ),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.calculate ),
            tooltip: 'Calculadora de Saldos',
            onPressed: () {

            },
          ),

          IconButton(
            icon: Icon(Icons.help_center ),
            tooltip: 'Ayuda',
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
