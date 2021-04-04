import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream_pro/models/Usuarios.dart';

import 'imagen_mi_cuenta.dart';

class BodyMiCuenta extends StatelessWidget {
  User user;
  BodyMiCuenta({this.user});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(Usuarios.TABLE_NAME)
            .where('correo_electronico', isEqualTo: user.email)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Error en la base de datos");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
              break;

            default:
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  children: [
                    Divider(
                      height: 50,
                      thickness: 3,
                      indent: 70,
                      endIndent: 70,
                      color: Color(0xFF01579B),
                    ),
                    UsuarioImagenMiCuenta(user: user),
                    Divider(
                      height: 50,
                      thickness: 3,
                      indent: 30,
                      endIndent: 30,
                      color: Color(0xFF01579B),
                    ),
                    Text.rich(TextSpan(
                      text: user.displayName == null
                          ? snapshot.data.docs[0].data()["displayname"]
                          : user.displayName,
                      style: TextStyle(
                        fontSize: 32,
                        color: Color(0xFF01579B),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    Divider(
                      height: 50,
                      thickness: 3,
                      indent: 30,
                      endIndent: 30,
                      color: Color(0xFF01579B),
                    ),
                    Text.rich(TextSpan(
                      text: 'Correo:',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF37474F),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    Text.rich(TextSpan(
                      text: user.email,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF263238),
                      ),
                    )),
                    Divider(
                      height: 25,
                      color: Colors.white,
                    ),
                    Text.rich(TextSpan(
                      text: 'Telefono:',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF37474F),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    Text.rich(TextSpan(
                      text: user.displayName == null
                          ? snapshot.data.docs[0].data()["telefono"]
                          : user.phoneNumber,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF263238),
                      ),
                    )),
                    Divider(
                      height: 25,
                      color: Colors.white,
                    ),
                    Text.rich(TextSpan(
                      text: 'País o Región:',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF37474F),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    Text.rich(TextSpan(
                      text: "Honduras",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF263238),
                      ),
                    )),
                    Divider(
                      height: 50,
                      thickness: 3,
                      indent: 30,
                      endIndent: 30,
                      color: Color(0xFF01579B),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Gracias por utilizar ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Stream Pro',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ', querido usuario!'),
                        ],
                      ),
                    )
                  ],
                ),
              );

              break;
          }
        });
  }
}
