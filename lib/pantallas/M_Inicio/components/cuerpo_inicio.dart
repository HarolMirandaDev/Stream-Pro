import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'inicio_nuevos_registros.dart';
import 'inicio_fecha_renovacion_banner.dart';
import 'encabezado_inicio.dart';
import 'inicio_renovaciones_clientes.dart';
import 'inicio_renovaciones_proveedores.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(10)),
            EncabezadoInicio(),

            SizedBox(height: getProportionateScreenWidth(10)),
            FechaRenovacion(),

            NuevosRegistros(),
            RenovacionesProveedores(),
            SizedBox(height: getProportionateScreenWidth(30)),
            RenovacionesClientes(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
