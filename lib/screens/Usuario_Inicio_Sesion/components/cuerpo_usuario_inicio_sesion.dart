import 'package:flutter/material.dart';
import 'package:stream_pro/components/social_cards.dart';
import 'package:stream_pro/components/texto_no_tiene_usuario.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/screens/Usuario_Inicio_Sesion_Exitosa/pantalla_usuario_inicio_sesion_exitosa.dart';
import 'formulario_usuario_inicio_sesion.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Iniciar Sesión",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "Utilice su correo electrónico y contraseña \no utilice su red social.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Puedes iniciar sesión con GOOGLE',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SocialCards(
                      icon: "assets/icons/google-icon.svg",
                      press: () {
                        Navigator.pushNamed(context, PantallaUsuarioInicioSesionExitosa.routeName );
                      },
                    ),
                    //SocialCards(icon: "assets/icons/facebook-2.svg", press: () {},),
                    //SocialCards(icon: "assets/icons/twitter.svg", press: () {},),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                TextoNoTieneUsuario(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
