import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/cuerpo_usuario_inicio_sesion.dart';

class PantallaUsuarioInicioSesion extends StatelessWidget {
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: CuerpoUsuarioInicioSesion(),
    );
  }
}
