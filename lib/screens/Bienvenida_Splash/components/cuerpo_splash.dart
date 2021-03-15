import 'package:flutter/material.dart';
import 'package:stream_pro/screens/M_Inicio/pantalla_inicio.dart';
import 'package:stream_pro/screens/Nuevo_Cliente/pantalla_nuevo_cliente_inicio.dart';
import 'package:stream_pro/screens/usuario_inicio_sesion/pantalla_usuario_inicio_sesion.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';

// This is the best practice
import '../components/contenido_splash.dart';
import '../../../components/custom_boton_predeterminado.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Bienvenido a Stream Pro, ¡Empecemos!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "Ayudamos a las personas a contabilizar cuentas streaming.",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Mostramos la forma más fácil en control de usuarios. \n Quédate en casa.",
      "image": "assets/images/splash_3.png"
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
                itemBuilder: (context, index) => ContenidoSplash(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    BotonPredeterminado(
                      text: "Continuar",
                      press: (){
                        //Navigator.pushNamed(context, PantallaInicio.routeName );
                        //Navigator.pushNamed(context, PantallaNuevoClienteInicio.routeName);
                        Navigator.pushNamed(context, PantallaUsuarioInicioSesion.routeName);
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