import 'package:flutter/material.dart';
import 'package:stream_pro/config/size_config.dart';
import 'inicio_titulo_seccion.dart';

class RenovacionesProveedores extends StatelessWidget {
  const RenovacionesProveedores({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)
          ),
          child: TituloSeccion(
            title: "Renovación de Proveedores",
            press: () {},
          ),
        ),

        SizedBox(height: getProportionateScreenWidth(20)),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal ,

          child: Row (
            children: <Widget>[
              SpecialOfferCard(
                nombreProveedor: "Crack",
                cantidadDeCuentas: 10,
                press: () {},
              ),

              SpecialOfferCard(
                nombreProveedor: "Death",
                cantidadDeCuentas: 12,
                press: () {},
              ),

              SpecialOfferCard(

                nombreProveedor: "Jack",
                cantidadDeCuentas: 04,
                press: () {},
              ),

              SpecialOfferCard(

                nombreProveedor: "ColombiNet",
                cantidadDeCuentas: 24,
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20)),

            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.nombreProveedor,
    @required this.cantidadDeCuentas,
    @required this.press,
  }) : super(key: key);

  final String nombreProveedor;
  final int cantidadDeCuentas;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(20),
        right: getProportionateScreenWidth(20),
        bottom: getProportionateScreenWidth(5),
      ),

      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(340),
          height: getProportionateScreenWidth(75),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF343434).withOpacity(0.4),
                    image: new DecorationImage(
                      image: ExactAssetImage('assets/images/background1.png'),
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(

                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$nombreProveedor\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                          ),
                        ),

                        TextSpan(
                          text: "$cantidadDeCuentas Cuentas",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(22),
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}