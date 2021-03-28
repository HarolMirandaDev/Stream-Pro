import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';


class BodyAyuda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Stream Pro", style: headingStyle),


                SizedBox(height: kDefaultPadding / 2),



                Divider(
                  height: 50,
                  thickness: 3,
                  indent: 30,
                  endIndent: 30,
                  color: Color(0xFF01579B),
                ),

                RichText(
                  textAlign:TextAlign.justify,
                
                  text: TextSpan(

                    children: <TextSpan>[
                      TextSpan(text: 'Es una aplicación gratuita que permite la '
                          'gestión y el control de cuentas en el servicio de Streaming; ya sea ',
                        style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 15,  ),

                        children: <TextSpan>[
                          TextSpan(text: 'Netflix, Amazon Prime Video, Disney+, HBO GO, Fox Play, '
                              'Spotify ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: kAzulMaterial, fontSize: 15,  ),

                            children: <TextSpan>[
                              TextSpan(text: 'entre otras. Cuenta con una interfaz gráfica cómoda e '
                                  'interactiva, y entre sus características principales ofrece: ',
                                style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 15,  ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],

                  ),
                ),

                RichText(
                  textAlign:TextAlign.left,
                  text: TextSpan(

                    children: <TextSpan>[
                      TextSpan(text: '✔ Gestión de correos, contraseñas.\n'
                          '✔ Control de precio de las cuentas.\n'
                          '✔ Acceso a lista de clientes y proveedores.\n'
                          '✔ Generador de datos para renovaciones.\n'
                          '',

                        style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 15,  ),

                      ),
                    ],

                  ),
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }



}


