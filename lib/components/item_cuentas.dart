import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Proveedores.dart';
import 'package:stream_pro/screens/Nueva_Cuenta/components/form_nueva_cuenta.dart';
import 'package:stream_pro/screens/Nueva_Cuenta/pantalla_nueva_cuenta_inicio.dart';

class ItemWigetCuentas extends StatelessWidget {


  QueryDocumentSnapshot snapshot;
  final databaseReference =
      FirebaseFirestore.instance.collection(Proveedores.TABLE_NAME);

  ItemWigetCuentas(QueryDocumentSnapshot snapshot) {
    this.snapshot = snapshot;
  }

  @override
  Widget build(BuildContext context) {
    List<String> lista = ["Seleccione un proveedor"];

    FirebaseFirestore.instance.collection(Proveedores.TABLE_NAME).get().then(
            (QuerySnapshot querySnapshot) =>
              querySnapshot.docs.forEach(
                  (doc) {
                if(doc["user"] == FirebaseAuth.instance.currentUser.uid) {
                  lista.add(doc["nombre"]);
                }
              }
            )
    );

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
                  title: new Text(
                      snapshot.data()["fechaCompra"] + " - " +
                (snapshot.data()["proveedor"]=='Seleccione un proveedor'?"SIN PROVEEDOR":snapshot.data()["proveedor"]),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 23,
                      )),
                  subtitle: new Text(snapshot.data()["correoElectronico"],
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
                            builder: (context) => PantallaNuevaCuentaInicio(lista)
                        )
                    );
                    FormularioNuevaCuenta.update = true;
                    FormularioNuevaCuenta.update_values(
                      snapshot.id,
                      snapshot.data()["correoElectronico"],
                      snapshot.data()["contrasenia"],
                      snapshot.data()["fechaCompra"],
                      snapshot.data()["proveedor"],
                      snapshot.data()["plataforma"],
                      snapshot.data()["membresia"],
                      snapshot.data()["precio"],
                      snapshot.data()["pagado"],
                    );

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
                Share.share("*Renovación Cuenta:*" +
                    "\nProveedor: " +
                    snapshot.data()['proveedor'] +
                    "\nCorreo: " +
                    snapshot.data()['correoElectronico'] +
                    "\nContraseña: " +
                    snapshot.data()['contrasenia'] +
                    "\nPlataforma: " +
                    snapshot.data()['plataforma'] +
                    "\nMembresia: " +
                    snapshot.data()['membresia']);
              },
            ),

          ],
        ));
  }
}
