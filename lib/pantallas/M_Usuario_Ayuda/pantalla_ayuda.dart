import 'package:flutter/material.dart';
import 'package:shop_app/pantallas/M_Usuario_Ayuda/components/cuerpo_ayuda.dart';

class PantallaAyuda extends StatelessWidget{
  static String routeName = "/ayuda";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BodyAyuda(),
    );
  }


}