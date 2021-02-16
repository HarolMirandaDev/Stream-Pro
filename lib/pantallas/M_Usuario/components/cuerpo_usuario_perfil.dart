import 'package:flutter/material.dart';

import 'menu_usuario_perfil.dart';
import 'imagen_usuario_perfil.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          UsuarioImagen(),
          SizedBox(height: 20),
          UsuarioMenu(
            text: "Mi Cuenta",
            icon: "assets/icons/Icono Menu Informacion.svg",
            press: () => {},
          ),

          UsuarioMenu(
            text: "Ajustes",
            icon: "assets/icons/Icono Ajustes.svg",
            press: () {},
          ),
          UsuarioMenu(
            text: "Ayuda",
            icon: "assets/icons/Icono Interrogacion.svg",
            press: () {},
          ),
          UsuarioMenu(
            text: "Cerrar Sesión",
            icon: "assets/icons/Icono Cerrar Sesion.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
