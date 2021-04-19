import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stream_pro/config/constants.dart';

class Clientes {
  static final String TABLE_NAME = "clientes";
  final String user;
  final String nombre;
  final String pais;
  final String telefono;
  final String correo_electronico;
  final String fecha_ventas;
  final String fecha_renovacion;
  final String pago;

  Clientes(
      {this.nombre,
      this.pais,
      this.telefono,
      this.correo_electronico,
      this.fecha_ventas,
        this.fecha_renovacion,
      this.user,
      this.pago});

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
      'fecha_renovacion': fecha_renovacion,
      'pago': pago,
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
        fecha_renovacion: parsedJson['fecha_renovacion'],
        pago: parsedJson['pago'],
        user: parsedJson['user']);
  }

  Future<void> addClientes(CollectionReference clientes) {
    return clientes
        .add(toMap())
        .then((value) =>
            mensajeToast("La cuenta  " + nombre + ", ha sido registrada"))
        .catchError((error) => mensajeToast(error));
  }

  Future<void> updateClientes(CollectionReference cuentas, String uid) {
    return cuentas
        .doc(uid)
        .update(toMap())
        .then((value) =>
            mensajeToast("La cuenta  " + nombre + ", ha sido actualizada"))
        .catchError((error) => mensajeToast(error));
  }
}
