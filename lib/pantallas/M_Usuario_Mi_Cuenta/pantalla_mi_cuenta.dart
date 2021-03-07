import 'package:flutter/material.dart';
import 'package:shop_app/pantallas/M_Usuario_Mi_Cuenta/components/cuerpo_mi_cuenta.dart';

class PantallaMiCuenta extends StatelessWidget{
  static String routeName = "/mi_cuenta";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BodyMiCuenta(),
    );
  }


}