import 'package:flutter/material.dart';
import 'package:stream_pro/config/size_config.dart';
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
            SizedBox(height: getProportionateScreenHeight(20)),
            EncabezadoInicio(),

            FechaRenovacion(),

            NuevosRegistros(),

            SizedBox(height: getProportionateScreenHeight(20)),
            RenovacionesClientes(),

            SizedBox(height: getProportionateScreenHeight(20)),
            RenovacionesProveedores(),






          ],
        ),
      ),
    );
  }
}
