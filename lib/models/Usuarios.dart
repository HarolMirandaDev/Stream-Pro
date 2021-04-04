
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Usuarios{

   static final String TABLE_NAME = "usuarios";
   final String displayname;
   final String correo_electronico;
   final String telefono;
   final String direccion;

   Usuarios({this.displayname,
             this.correo_electronico,
             this.telefono,
             this.direccion});

    @override
    String toString() {
      return displayname;
    }

   Map<String, dynamic> toMap() {
     return {
       'displayname': displayname,
       'correo_electronico': correo_electronico,
       'telefono': telefono,
       'direccion': direccion
     };
   }
}