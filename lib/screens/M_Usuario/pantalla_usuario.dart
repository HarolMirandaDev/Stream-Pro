import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/cuerpo_usuario_perfil.dart';

class PantallaUsuario extends StatelessWidget {
  static String routeName = "/usuario";
  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuario"),
        backgroundColor: Theme.of(context).hoverColor,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 10,
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),

      body: Body(user: user),

    );
  }
}
