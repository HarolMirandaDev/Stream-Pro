import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream_pro/components/renovacion_cliente.dart';
import 'package:stream_pro/models/Cliente.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Clientes.dart';
import 'inicio_titulo_seccion.dart';

class RenovacionesClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: TituloSeccion(title: "Renovación de Clientes", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(Clientes.TABLE_NAME)
              .where("user", isEqualTo: FirebaseAuth.instance.currentUser.uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Error en la base de datos");
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
                break;
              default:
                return Builder(
                  builder: (context) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            snapshot.data.size,
                            (index) {
                              return RenovacionCliente(
                                  snapshot: snapshot.data.docs[index]);
                              return SizedBox
                                  .shrink(); // here by default width and height is 0
                            },
                          ),
                          SizedBox(width: getProportionateScreenWidth(20)),
                        ],
                      ),
                    );
                  },
                );
                break;
            }
          },
        ),
      ],
    );
  }
}
