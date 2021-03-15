import 'package:flutter/material.dart';


import 'components/clientes_cuerpo.dart';

class PantallaClientes extends StatelessWidget {
  static String routeName = "/clientes";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes"),
      ),
      body: Body(),

    );
  }
}
