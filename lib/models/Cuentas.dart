import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Cuentas {
  static final String TABLE_NAME = "cuentas";
  final String user;
  final String correoElectronico;
  final String contrasenia;
  final String fechaCompra;
  final String proveedor;
  final String plataforma;
  final String membresia;
  final double precio;
  bool pagado = false;

  bool cuenta_pagada() {
    return pagado;
  }
  void traer_pagada(bool pagado) {
    this.pagado = pagado;
  }

  Cuentas(
      {this.correoElectronico,
      this.contrasenia,
      this.fechaCompra,
      this.proveedor,
      this.plataforma,
      this.membresia,
      this.precio,
      this.user});

  Map<String, dynamic> toMap() {
    return {
      'correoElectronico': correoElectronico,
      'contrasenia': contrasenia,
      'fechaCompra': fechaCompra,
      'proveedor': proveedor,
      'plataforma': plataforma,
      'membresia': membresia,
      'precio': precio,
      'pagado': pagado,
      'user': user
    };
  }

  factory Cuentas.fromJson(Map<String, dynamic> parsedJson) {
    return Cuentas(
        correoElectronico: parsedJson['correoElectronico'],
        contrasenia: parsedJson['contrasenia'],
        fechaCompra: parsedJson['fechaCompra'],
        proveedor: parsedJson['proveedor'],
        plataforma: parsedJson['plataforma'],
        membresia: parsedJson['membresia'],
        precio: parsedJson['precio'],
        user: parsedJson['user']);
  }

  Future<void> addCuentas(CollectionReference cuentas) {
      // Call the user's CollectionReference to add a new user
      return cuentas
          .add({'correoElectronico': correoElectronico,
              'contrasenia': contrasenia,
              'fechaCompra': fechaCompra,
              'proveedor': proveedor,
              'plataforma': plataforma,
              'membresia': membresia,
              'precio': precio,
              'pagado': pagado,
              'user': user
          })
          .then((value) =>  Fluttertoast.showToast(
                    msg: "La cuenta  " + correoElectronico + ", ha sido registrada",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Color(0xff01579b),
                    textColor: Colors.white,
                    fontSize: 22.0)
                    )
          .catchError((error) => Fluttertoast.showToast(
                    msg: error,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Color(0xff01579b),
                    textColor: Colors.white,
                    fontSize: 22.0));
    }

     Future<void> updateCuentas(CollectionReference cuentas,String uid) {
      // Call the user's CollectionReference to add a new user
      return cuentas
          .doc(uid)
          .update({'correoElectronico': correoElectronico,
                    'contrasenia': contrasenia,
                    'fechaCompra': fechaCompra,
                    'proveedor': proveedor,
                    'plataforma': plataforma,
                    'membresia': membresia,
                    'precio': precio,
                    'pagado': pagado,
                    'user': user
                }).then((value) =>  Fluttertoast.showToast(
                    msg: "La cuenta  " + correoElectronico + ", ha sido actualizada",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Color(0xff01579b),
                    textColor: Colors.white,
                    fontSize: 22.0)
                    )
          .catchError((error) => Fluttertoast.showToast(
                    msg: error,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Color(0xff01579b),
                    textColor: Colors.white,
                    fontSize: 22.0));
    }
}
