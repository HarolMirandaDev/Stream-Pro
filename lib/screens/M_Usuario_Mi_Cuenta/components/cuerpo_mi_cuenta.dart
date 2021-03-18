import 'package:flutter/material.dart';

import 'imagen_mi_cuenta.dart';

class BodyMiCuenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Column(

        children: [

          Divider(
            height: 50,
            thickness: 3,
            indent: 70,
            endIndent: 70,
            color: Color(0xFF37474F),
          ),

          UsuarioImagenMiCuenta(),

          Divider(
            height: 50,
            thickness: 3,
            indent: 30,
            endIndent: 30,
            color: Color(0xFF37474F),
          ),

          Text.rich(
              TextSpan(
                text: 'Harol Miranda:',
                style: TextStyle(
                  fontSize: 32,
                  color: Color(0xFF263238),
                  fontWeight: FontWeight.bold,
                ),
              )
          ),

          Divider(
            height: 50,
            thickness: 3,
            indent: 30,
            endIndent: 30,
            color: Color(0xFF37474F),
          ),

          Text.rich(
              TextSpan(
                text: 'Correo:',
                style: TextStyle(
                    fontSize: 24,
                  color: Color(0xFF37474F),
                  fontWeight: FontWeight.bold,
                ),
              )
          ),

          Text.rich(
              TextSpan(
                text: 'harolmiranda@gmail.com',
                style: TextStyle(
                    fontSize: 22,
                  color: Color(0xFF263238),
                ),
              )
          ),

          Divider(
            height: 25,
            color: Colors.white,
          ),

          Text.rich(
              TextSpan(
                text: 'Telefono:',
                style: TextStyle(
                    fontSize: 24,
                  color: Color(0xFF37474F),
                  fontWeight: FontWeight.bold,
                ),
              )
          ),

          Text.rich(
              TextSpan(
                text: '+504 9572 4342',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF263238),
                ),
              )
          ),

          Divider(
            height: 25,
            color: Colors.white,
          ),

          Text.rich(
              TextSpan(
                text: 'Dirección:',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF37474F),
                  fontWeight: FontWeight.bold,
                ),
              )
          ),

          Text.rich(
              TextSpan(
                text: 'Danlí, El Paraíso',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF263238),
                ),
              )
          ),


          Divider(
            height: 50,
            thickness: 3,
            indent: 30,
            endIndent: 30,
            color: Color(0xFF37474F),
          ),

          RichText(
            text: TextSpan(
              text: 'Gracias por utilizar ',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(text: 'Stream Pro', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ', querido usuario!'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
