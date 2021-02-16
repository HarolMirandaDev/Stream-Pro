import 'package:flutter/material.dart';
import 'package:shop_app/components/renovacion_cliente.dart';
import 'package:shop_app/models/Cliente.dart';

import '../../../size_config.dart';
import 'inicio_titulo_seccion.dart';

class RenovacionesClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: TituloSeccion(title: "Renovación de Clientes", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoClientes.length,
                (index) {
                  if (demoClientes[index].vigente)
                    return RenovacionCliente(product: demoClientes[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
