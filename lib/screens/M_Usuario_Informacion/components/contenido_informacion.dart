import 'package:flutter/material.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';

class ContenidoInformacion extends StatelessWidget {
  const ContenidoInformacion({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "Stream Pro",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            color: kAzulMaterial,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(235),
          width: getProportionateScreenWidth(205),
        ),
      ],
    );
  }
}
