import 'package:flutter/material.dart';
import 'package:stream_pro/screens/M_Usuario_Ayuda/components/cuerpo_ayuda.dart';

class PantallaAyuda extends StatelessWidget{
  static String routeName = "/ayuda";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayuda"),
        backgroundColor: Color(0xFF01579B),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),

        body: BodyAyuda(),
    );
  }


}