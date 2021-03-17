import 'package:flutter/material.dart';

import 'components/proveedores_cuerpo.dart';

class PantallaProveedores extends StatelessWidget {
  static String routeName = "/proveedores";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Proveedores"),
        backgroundColor: Color(0xFF006064),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 10,
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Body(),
    );
  }
}
