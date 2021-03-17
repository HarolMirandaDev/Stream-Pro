import 'package:flutter/material.dart';

import 'components/cuerpo_mi_cuenta.dart';

class PantallaMiCuenta extends StatelessWidget {
  static String routeName = "/mi_cuenta";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi Cuenta"),
      ),
      body: BodyMiCuenta(),

    );
  }
}
