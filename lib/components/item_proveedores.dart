
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:stream_pro/models/Proveedores.dart';
import 'package:stream_pro/screens/Nuevo_Proveedor/components/form_nuevo_proveedor.dart';
import 'package:stream_pro/screens/Nuevo_Proveedor/pantalla_nuevo_proveedor_inicio.dart';
class ItemWigetProveedor extends StatelessWidget{

  QueryDocumentSnapshot snapshot;
  final databaseReference = FirebaseFirestore.instance.collection(Proveedores.TABLE_NAME);

  ItemWigetProveedor(QueryDocumentSnapshot snapshot){
    this.snapshot = snapshot;
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: Column(
            children: [
              ListTile(
                title: new Text(snapshot.data()["nombre"]),
                subtitle: new Text(snapshot.data()["telefono"]),
              )
            ],),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Modificar',
          color: Colors.blue,
          icon: Icons.edit,
          onTap: () {

            try{
              Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaNuevoProveedorInicio()));
              FormularioNuevoProveedor.update=true;
              FormularioNuevoProveedor.update_values(snapshot.data()["nombre"],
                  snapshot.data()["telefono"],
                  snapshot.data()["red_social"],
                  snapshot.data()["pais"],
                  snapshot.id);
            }catch(e){
              Fluttertoast.showToast(
                  msg: e.toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Color(0xff01579b),
                  textColor: Colors.white,
                  fontSize: 22.0
              );
            }

          }
        ),
        IconSlideAction(
          caption: 'Eliminar',
          color: Colors.black45,
          icon: Icons.delete,
          onTap: () => snapshot.reference.delete(),
        ),
        IconSlideAction(
          caption: 'Compartir',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () async {
            Share.share("Proveedor:"+
                "\nApodo: "+ snapshot.data()['nombre']+
                "\nPaís: "+ snapshot.data()['pais']+
                "\nTeléfono: "+ snapshot.data()['telefono']+
                "\nRed Social: "+ snapshot.data()['red_social']);
          },
        ),
      ],
    );
  }

}