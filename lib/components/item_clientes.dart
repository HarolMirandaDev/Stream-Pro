import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:stream_pro/Notificacion.dart';

import 'package:stream_pro/screens/Nuevo_Cliente/components/form_nuevo_cliente.dart';
import 'package:stream_pro/screens/Nuevo_Cliente/pantalla_nuevo_cliente_inicio.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Clientes.dart';
import 'package:stream_pro/models/Cuentas.dart';

class ItemWigetClientes extends StatelessWidget {
  QueryDocumentSnapshot snapshot;
  final databaseReference =
      FirebaseFirestore.instance.collection(Clientes.TABLE_NAME);


  ItemWigetClientes(QueryDocumentSnapshot snapshot) {
    this.snapshot = snapshot;
  }

  @override
  Widget build(BuildContext context) {

    List<String> lista = ["Ingrese una cuenta"];

    FirebaseFirestore.instance.collection(Cuentas.TABLE_NAME).get().then(
        (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((doc) {
              if (doc["user"] == FirebaseAuth.instance.currentUser.uid) {
                lista.add(doc["correoElectronico"]);
              }
            }));

    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(28),
          vertical: getProportionateScreenWidth(1),
        ),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF343434).withOpacity(0.4),
              image: new DecorationImage(
                image: ExactAssetImage('assets/images/background3.png'),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                ListTile(

                  title: new Text(snapshot.data()["fecha_renovacion"] + " - "+snapshot.data()["nombre"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 23,
                      )),
                  subtitle: new Text(snapshot.data()["correo_electronico"]=="Ingrese una cuenta" ? "SIN CUENTA":snapshot.data()["correo_electronico"],
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontSize: 22,
                      )),
                )
              ],
            ),
          ),
          secondaryActions: <Widget>[
            IconSlideAction(
                caption: 'Modificar',
                color: Color(0xFF006064),
                icon: Icons.edit,
                onTap: () {
                  try {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PantallaNuevoClienteInicio(lista)
                        )
                    );
                    FormularioNuevoCliente.update = true;
                    FormularioNuevoCliente.update_values(
                        snapshot.data()["nombre"],
                        snapshot.data()["pais"],
                        snapshot.data()["correo_electronico"],
                        snapshot.data()["telefono"],
                        snapshot.data()["fecha_venta"],
                        snapshot.data()["pago"],
                        snapshot.id);
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: e.toString(),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Color(0xff01579b),
                        textColor: Colors.white,
                        fontSize: 22.0);
                  }
                }),

            IconSlideAction(
              caption: 'Eliminar',
              color: Color(0xFFAD1457),
              icon: Icons.delete,
              onTap: () => snapshot.reference.delete(),
            ),

            IconSlideAction(
              caption: 'Compartir',
              color: Color(0xFF01579B),
              icon: Icons.share,
              onTap: () async {
                Share.share("*Cliente:*" +
                    "\nNombre: " +
                    snapshot.data()['nombre'] +
                    "\nCorreo: " +
                    snapshot.data()['correo_electronico'] +
                    "\nTeléfono: " +
                    snapshot.data()['telefono'] +
                    "\nFecha Venta: " +
                    snapshot.data()['fecha_venta']);
              },
            ),
          ],
        ));
  }
}
