import 'package:flutter/material.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';

import 'form_nueva_cuenta.dart';

class Body extends StatelessWidget {
  List<String> lista;
  Body(List<String> lista){
    this.lista = lista;
  }

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
                Text("Nueva Cuenta", style: headingStyle),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                FormularioNuevaCuentaInicio(lista),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SizedBox(height: getProportionateScreenHeight(20))
              ],
            ),
          ),
        ),
      ),
    );
  }



}


