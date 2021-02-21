import 'package:flutter/material.dart';

import 'components/cuentas_cuerpo.dart';

class PantallaCuentas extends StatelessWidget {
  static String routeName = "/cuentas";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuentas"),
      ),
      body: Body(),

    );
  }
}
