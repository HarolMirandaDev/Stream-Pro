import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Clientes {
  static final String TABLE_NAME = "clientes";
  final String user;
  final String nombre;
  final String pais;
  final String telefono;
  final String correo_electronico;
  final String fecha_ventas;

  Clientes(
      {this.nombre,
      this.pais,
      this.telefono,
      this.correo_electronico,
      this.fecha_ventas,
      this.user});

  @override
  String toString() {
    return nombre;
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'pais': pais,
      'telefono': telefono,
      'correo_electronico': correo_electronico,
      'fecha_venta': fecha_ventas,
      'user': user
    };
  }

  factory Clientes.fromJson(Map<String, dynamic> parsedJson) {
    return Clientes(
        nombre: parsedJson['nombre'],
        pais: parsedJson['pais'],
        telefono: parsedJson['telefono'],
        correo_electronico: parsedJson['correo_electronico'],
        fecha_ventas: parsedJson['fecha_venta'],
        user: parsedJson['user']);
  }


  Future<void> addClientes(CollectionReference clientes) {
    // Call the user's CollectionReference to add a new user
    return clientes
        .add({'nombre': nombre,
      'pais': pais,
      'telefono': telefono,
      'correo_electronico': correo_electronico,
      'fecha_venta': fecha_ventas,
      'user': user
    })
        .then((value) =>  Fluttertoast.showToast(
        msg: "La cuenta  " + nombre + ", ha sido registrada",
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

  Future<void> updateClientes(CollectionReference cuentas,String uid) {
    // Call the user's CollectionReference to add a new user
    return cuentas
        .doc(uid)
        .update({'nombre': nombre,
      'pais': pais,
      'telefono': telefono,
      'correo_electronico': correo_electronico,
      'fecha_venta': fecha_ventas,
      'user': user
    }).then((value) =>  Fluttertoast.showToast(
        msg: "La cuenta  " + nombre + ", ha sido actualizada",
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
