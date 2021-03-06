import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class FormularioErroneo_Prueba extends StatelessWidget {
  const FormularioErroneo_Prueba({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final String errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          formErrorText(error: errors)
       ]
    );
  }

  Row formErrorText({String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Icono Error.svg",
          height: getProportionateScreenWidth(14),
          width: getProportionateScreenWidth(14),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}
