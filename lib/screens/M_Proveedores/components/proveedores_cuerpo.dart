import 'package:flutter/material.dart';
import 'package:stream_pro/screens/M_Proveedores/components/proveedores_encabezado.dart';
import 'package:stream_pro/config/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            EncabezadoProveedores(),
            Divider(height: 20, thickness: 3, indent: 25, endIndent: 25, color: Color(0xFF006064)),
            SizedBox(height: getProportionateScreenWidth(10)),
            SizedBox(height: getProportionateScreenWidth(30)),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
