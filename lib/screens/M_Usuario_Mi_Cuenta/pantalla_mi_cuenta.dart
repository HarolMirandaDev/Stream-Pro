import 'package:flutter/material.dart';

import 'components/cuerpo_mi_cuenta.dart';

class PantallaMiCuenta extends StatelessWidget {
  static String routeName = "/mi_cuenta";
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi Cuenta"),
        backgroundColor: Color(0xFF01579B),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: BodyMiCuenta(),
    );
  }
}
