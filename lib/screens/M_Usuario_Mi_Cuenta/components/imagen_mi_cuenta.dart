import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UsuarioImagenMiCuenta extends StatelessWidget {
  User user;
  UsuarioImagenMiCuenta({this.user});


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 180,
      width: 180,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: Image.network(user.photoURL).image,
            backgroundColor: Colors.white,

          ),
          Positioned(
            right: -12,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFF37474F),
                onPressed: () {

                },
                child: SvgPicture.asset("assets/icons/Icono Camara 2.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
