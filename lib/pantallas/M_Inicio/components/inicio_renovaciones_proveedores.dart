import 'package:flutter/material.dart';

import '../../../size_config.dart';
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
          scrollDirection: Axis.horizontal,

          child: Column (
            children: [
              SpecialOfferCard(
                image: "assets/images/Ejemplo.png",
                category: "Crack",
                numOfBrands: 10,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/Ejemplo.png",
                category: "Death",
                numOfBrands: 12,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/Ejemplo.png",
                category: "Jack",
                numOfBrands: 04,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/Ejemplo.png",
                category: "ColombiNet",
                numOfBrands: 24,
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
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
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
          height: getProportionateScreenWidth(66),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff01579b),
                        Color(0xff01579b),
                      ],
                    ),
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
                    text: "$category\t" + "-\t$numOfBrands Cuentas",
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
