import 'package:flutter/material.dart';
import 'package:shop_app/pantallas/M_Usuario_Ayuda/pantalla_ayuda.dart';
import 'package:shop_app/pantallas/M_Usuario_Mi_Cuenta/pantalla_mi_cuenta.dart';

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
          SizedBox(height: 30),
          UsuarioMenu(
            text: "Mi Cuenta",
            icon: "assets/icons/Icono Menu Usuario.svg",
            press: () => {
              Navigator.pushNamed(context, PantallaMiCuenta.routeName),
            },
          ),

          UsuarioMenu(
            text: "Ajustes",
            icon: "assets/icons/Icono Ajustes.svg",
            press: () {

            },
          ),
          UsuarioMenu(
            text: "Ayuda",
            icon: "assets/icons/Icono Interrogacion.svg",
            press: () {
              Navigator.pushNamed(context, PantallaAyuda.routeName);
            },
          ),
          UsuarioMenu(
            text: "Cerrar Sesión",
            icon: "assets/icons/Icono Cerrar Sesion.svg",
            press: () {

            },
          ),
        ],
      ),
    );
  }
}
