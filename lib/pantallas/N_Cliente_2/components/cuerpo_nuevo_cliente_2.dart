import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

import 'form_nueva_cuenta_cliente_2.dart';

class Body extends StatelessWidget {
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
                Text("Nuevo Cliente", style: headingStyle),
                Text(
                  "A continuación se le muestra un formulario; porfavor  \n ingrese la información correcta.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                FormularioNuevoClienteInicio2(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SizedBox(height: getProportionateScreenHeight(20)),

              ],
            ),
          ),
        ),
      ),
    );
  }



}


