import 'package:flutter/material.dart';

import 'components/cuentas_cuerpo.dart';

class PantallaCuentas extends StatelessWidget {
  static String routeName = "/cuentas";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuentas"),
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
