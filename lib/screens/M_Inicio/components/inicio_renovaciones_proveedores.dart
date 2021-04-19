import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Clientes.dart';
import 'package:stream_pro/models/Proveedores.dart';
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
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: TituloSeccion(
            title: "Renovación de Proveedores",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(Proveedores.TABLE_NAME)
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
                  return Builder(builder: (context) {
                    List<Widget> proveedores = [];
                    if(snapshot.data.size>0) {
                      for (int i = 0; i < snapshot.data.size; i++) {
                        proveedores.add(SpecialOfferCard(
                          nombreProveedor: snapshot.data.docs[i]
                              .data()['nombre'],
                          cantidadDeCuentas: int.parse(
                              snapshot.data.docs[i].data()['cuentas']
                                  .toString()),
                          press: () {
                            alerta([
                              TextButton(onPressed: () {

                                Navigator.of(context).pop();
                                Share.share("*RENOVACIÓN "+DateFormat("dd/MMMM/yy").format(DateTime.now()) + "*\n"+
                                    "Cuentas:\n"+""
                                );
                              }, child: Text("Si")),
                              TextButton(onPressed: () {
                                Navigator.of(context).pop();
                              }, child: Text("No"))
                            ]);
                          },
                        ));
                      }
                    }else{
                      proveedores.add(SpecialOfferCard(
                        nombreProveedor: "No hay renovaciones en esta fecha",
                        cantidadDeCuentas: 0,
                        press: () {

                        },
                      ));
                    }

                    proveedores
                        .add(SizedBox(width: getProportionateScreenWidth(20)));
                    return Row(
                      children: proveedores,
                    );
                  });
                  break;
              }
            },
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.nombreProveedor,
    @required this.cantidadDeCuentas,
    @required this.press,
  }) : super(key: key);

  final String nombreProveedor;
  final int cantidadDeCuentas;
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
          height: getProportionateScreenWidth(75),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF343434).withOpacity(0.4),
                    image: new DecorationImage(
                      image: ExactAssetImage('assets/images/background1.png'),
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.circular(5),
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
                          text: "$nombreProveedor\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                          ),
                        ),
                        TextSpan(
                          text: "$cantidadDeCuentas Cuentas",
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
AlertDialog alerta(var actions) {
  return AlertDialog(
    title: new Text("Advertencia"),
    content: new Text("Desea renovar las cuentas de este proveedor:"),
    actions: actions,
  );
}
