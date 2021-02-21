import 'package:flutter/material.dart';

import 'components/nueva_cuenta_cuerpo.dart';

class PantallaNuevaCuenta extends StatelessWidget {
  static String routeName = "/nuevacuenta";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Body(),
    );
  }
}
