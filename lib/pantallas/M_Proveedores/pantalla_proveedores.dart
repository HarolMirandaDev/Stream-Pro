import 'package:flutter/material.dart';

import 'components/proveedores_cuerpo.dart';

class PantallaProveedores extends StatelessWidget {
  static String routeName = "/proveedores";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Proveedores"),
      ),
      body: Body(),
    );
  }
}
