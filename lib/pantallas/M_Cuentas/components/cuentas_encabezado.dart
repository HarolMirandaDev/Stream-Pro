import 'package:flutter/material.dart';

import '../../../size_config.dart';

import 'cuentas_campo_buscar.dart';

class EncabezadoCuentas extends StatelessWidget {
  const EncabezadoCuentas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CampoBuscarCuentas(),
        ],
      ),
    );
  }
}
