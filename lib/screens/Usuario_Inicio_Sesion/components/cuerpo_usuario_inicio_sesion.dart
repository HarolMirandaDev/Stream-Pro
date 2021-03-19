import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stream_pro/components/social_cards.dart';
import 'package:stream_pro/components/texto_no_tiene_usuario.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/screens/Usuario_Inicio_Sesion_Exitosa/pantalla_usuario_inicio_sesion_exitosa.dart';
import 'formulario_usuario_inicio_sesion.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class Body extends StatelessWidget {


  final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static FirebaseAuth auth(){
    return _auth;
  }

  void login_google(BuildContext context) async {

    GoogleSignInAccount gUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await gUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential fUser = (await _auth.signInWithCredential(credential));

    if (fUser != null) {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) =>  PantallaUsuarioInicioSesionExitosa()));
      Fluttertoast.showToast(
          msg: fUser.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Color(0xff01579b),
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "El usario no existe",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Color(0xff01579b),
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }


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
                        login_google(context);
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
