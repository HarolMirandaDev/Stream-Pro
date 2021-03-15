import 'package:flutter/material.dart';
import 'package:stream_pro/components/custom_boton_predeterminado.dart';
import 'package:stream_pro/screens/M_Inicio/pantalla_inicio.dart';
import 'package:stream_pro/config/size_config.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Column col = new Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/exitoso.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Acceso exitoso",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.8,
          child: BotonPredeterminado(
            text: "Continuar",
            press: () {
              Navigator.pushNamed(context, PantallaInicio.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );


    return col;
  }
}
