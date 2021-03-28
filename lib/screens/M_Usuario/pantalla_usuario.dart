import 'package:flutter/material.dart';
import 'components/cuerpo_usuario_perfil.dart';

class PantallaUsuario extends StatelessWidget {
  static String routeName = "/usuario";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuario"),
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
