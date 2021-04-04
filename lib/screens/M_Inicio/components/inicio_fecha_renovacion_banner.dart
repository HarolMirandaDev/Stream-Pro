import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Usuarios.dart';

class FechaRenovacion extends StatelessWidget {
  const FechaRenovacion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User userFir = FirebaseAuth.instance.currentUser;
    CollectionReference coleccion_db =
        FirebaseFirestore.instance.collection(Usuarios.TABLE_NAME);

    var now = new DateTime.now();
    var formatter1 = new DateFormat("dd");
    var formatter2 = new DateFormat("MMMM");
    String formattedDate1 = formatter1.format(now);
    String formattedDate2 = formatter2.format(now);
    var mes;

    if (formattedDate2 == "January") {
      mes = "Enero";
    } else if (formattedDate2 == "February") {
      mes = "febrero";
    }
    if (formattedDate2 == "March") {
      mes = "marzo";
    } else if (formattedDate2 == "April") {
      mes = "abril";
    }
    if (formattedDate2 == "May") {
      mes = "mayo";
    } else if (formattedDate2 == "June") {
      mes = "junio";
    }
    if (formattedDate2 == "July") {
      mes = "Julio";
    } else if (formattedDate2 == "August") {
      mes = "agosto";
    }
    if (formattedDate2 == "September") {
      mes = "septiembre";
    } else if (formattedDate2 == "October") {
      mes = "octubre";
    }
    if (formattedDate2 == "November") {
      mes = "noviembre";
    } else if (formattedDate2 == "December") {
      mes = "diciembre";
    }

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(Usuarios.TABLE_NAME)
            .where('correo_electronico', isEqualTo: userFir.email)
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
              return Container(
                width: double.infinity,
                margin: EdgeInsets.all(getProportionateScreenWidth(22)),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(15),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF343434).withOpacity(0.4),
                  image: new DecorationImage(
                    image: ExactAssetImage('assets/images/background2.png'),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: 'Bienvenido ' +
                            (snapshot.data.size > 0
                                ? snapshot.data.docs[0].data()["displayname"]
                                : userFir.displayName) +
                            "\n",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                        ),
                      ),
                      TextSpan(
                        text: "Renovaciones al " +
                            formattedDate1 +
                            " de " +
                            mes, //debera obtener la fecha
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(22),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
              break;
          }
        });
  }
}
