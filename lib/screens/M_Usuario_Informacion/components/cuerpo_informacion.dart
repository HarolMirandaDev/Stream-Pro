import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream_pro/components/custom_boton_nuevos_registros.dart';
import 'package:stream_pro/screens/M_Inicio/pantalla_inicio.dart';
import 'package:stream_pro/screens/M_Usuario_Informacion/components/contenido_informacion.dart';
import 'package:stream_pro/screens/usuario_inicio_sesion/pantalla_usuario_inicio_sesion.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';

import '../../../components/custom_boton_predeterminado.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [

    {
      "text":
      "Ayudamos a las personas en la gestión y el control de cuentas\nen el servicio de Streaming; ",
      "image": "assets/images/splash_5.png"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => ContenidoInformacion(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),

              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),

                    RichText(
                      text: TextSpan(
                        text: 'Proyecto desarrollado por ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(text: 'Dev+ Team', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ', Harol Miranda'),
                        ],
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                        text: 'versión ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(text: '1.0.4 ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'abril, 2021'),
                        ],
                      ),
                    ),

                    Spacer(flex: 3),



                    BotomNuevosRegistros(
                      text: "Contáctanos",
                      press: () {

                        },
                    ),

                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}