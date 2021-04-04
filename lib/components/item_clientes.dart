import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Proveedores.dart';
import 'package:stream_pro/screens/Nuevo_Proveedor/components/form_nuevo_proveedor.dart';
import 'package:stream_pro/screens/Nuevo_Proveedor/pantalla_nuevo_proveedor_inicio.dart';

class ItemWigetProveedor extends StatelessWidget {
  QueryDocumentSnapshot snapshot;
  final databaseReference =
      FirebaseFirestore.instance.collection(Proveedores.TABLE_NAME);

  ItemWigetProveedor(QueryDocumentSnapshot snapshot) {
    this.snapshot = snapshot;
  }

  @override
  Widget build(BuildContext context) {
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
                  title: new Text(snapshot.data()["nombre"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                      )),
                  subtitle: new Text(snapshot.data()["red_social"],
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
                            builder: (context) =>
                                PantallaNuevoProveedorInicio()));
                    FormularioNuevoProveedor.update = true;
                    FormularioNuevoProveedor.update_values(
                        snapshot.data()["nombre"],
                        snapshot.data()["telefono"],
                        snapshot.data()["red_social"],
                        snapshot.data()["pais"],
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
                Share.share("Proveedor:" +
                    "\nApodo: " +
                    snapshot.data()['nombre'] +
                    "\nPaís: " +
                    snapshot.data()['pais'] +
                    "\nTeléfono: " +
                    snapshot.data()['telefono'] +
                    "\nRed Social: " +
                    snapshot.data()['red_social']);
              },
            ),
          ],
        ));
  }
}
