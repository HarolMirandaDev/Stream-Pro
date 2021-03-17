import 'package:flutter/material.dart';

import 'item_nombre_usuario.dart';
import 'item_etiqueta.dart';
import 'item_informacion.dart';
import 'imagen_mi_cuenta.dart';

class BodyMiCuenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Column(
        children: [
          UsuarioImagenMiCuenta(),

          ItemNombre(
            text: "Harol Miranda",
          ),

          ItemEtiqueta(
            text: "Correo Electronico",
          ),

          ItemInformacion(
            text: "harolmiranda@dev.com",
          ),

          ItemEtiqueta(
            text: "Telefono",
          ),

          ItemInformacion(
            text: "+504 9572 4342",
          ),

          ItemEtiqueta(
            text: "Dirección",
          ),

          ItemInformacion(
            text: "Danlí, El Paraíso",
          ),


        ],
      ),
    );
  }
}
