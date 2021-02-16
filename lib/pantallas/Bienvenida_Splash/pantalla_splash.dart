import 'package:flutter/material.dart';
import 'package:shop_app/pantallas/Bienvenida_Splash/components/cuerpo_splash.dart';
import 'package:shop_app/size_config.dart';

class PantallaSplash extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
