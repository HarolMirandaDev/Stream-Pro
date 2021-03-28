import 'package:flutter/material.dart';


import 'components/clientes_cuerpo.dart';

class PantallaClientes extends StatelessWidget {
  static String routeName = "/clientes";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes"),
        backgroundColor: Color(0xFF01579B),
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
