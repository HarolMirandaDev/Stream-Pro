import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'cuentas_encabezado.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            EncabezadoCuentas(),
            SizedBox(height: getProportionateScreenWidth(10)),

            SizedBox(height: getProportionateScreenWidth(30)),

            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
