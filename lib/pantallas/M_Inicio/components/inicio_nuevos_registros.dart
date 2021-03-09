import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/pantallas/Nuevo_Cliente/pantalla_nuevo_cliente_inicio.dart';
import 'package:shop_app/pantallas/Nuevo_Proveedor/pantalla_nuevo_proveedor_inicio.dart';
import 'package:shop_app/pantallas/Nueva_Cuenta/pantalla_nueva_cuenta_inicio.dart';
import '../../../size_config.dart';

class NuevosRegistros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Icono Nuevo Cliente.svg", "text": "Nuevo Cliente"},
      {"icon": "assets/icons/Icono Nuevo Proveedor.svg", "text": "Nuevo Proveedor"},
      {"icon": "assets/icons/Icono Nueva Cuenta.svg", "text": "Nueva Cuenta"},
    ];
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryCard(
            icon: categories[0]["icon"],
            text: categories[0]["text"],
            press: () {
              Navigator.pushNamed(context, PantallaNuevoClienteInicio.routeName);
            },
          ),
          CategoryCard(
            icon: categories[1]["icon"],
            text: categories[1]["text"],
            press: () {
              Navigator.pushNamed(context, PantallaNuevoProveedorInicio.routeName);
            },
          ),
          CategoryCard(
            icon: categories[2]["icon"],
            text: categories[2]["text"],
            press: () {
              Navigator.pushNamed(context, PantallaNuevaCuentaInicio.routeName);
            },
          ),
        ],

      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(100),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(50),
              width: getProportionateScreenWidth(110),
              decoration: BoxDecoration(
                color: Color(0xff01579b),
                borderRadius: BorderRadius.circular(5),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
