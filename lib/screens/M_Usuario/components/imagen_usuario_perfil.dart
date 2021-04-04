import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UsuarioImagen extends StatelessWidget {
  const UsuarioImagen({
    @required this.user,
    Key key,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: Image.network(user.photoURL == null
                    ? "https://png.clipart.me/previews/85b/psd-universal-blue-web-user-icon-45876.jpg"
                    : user.photoURL)
                .image,
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFF5F6F9),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/Icono Camara.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
