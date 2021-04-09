import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_formfield/flutter_datetime_formfield.dart';
import 'package:intl/intl.dart';
import 'package:stream_pro/components/custom_boton_nuevos_registros.dart';
import 'package:stream_pro/components/custom_formulario_erroneo.dart';
import 'package:stream_pro/models/Cuentas.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Proveedores.dart';

class FormularioNuevaCuentaInicio extends StatefulWidget {
  static bool update = false;
  List<String> lista;
  FormularioNuevaCuentaInicio(List<String> lista){
    this.lista = lista;
  }

  static void update_values(
      String uid_update,
      String email,
      String password,
      String fecha_compra,
      String proveedor,
      String seleccion_plataforma_streaming_valor,
      String seleccion_membresia_valor,
      double precio,
      bool pagado) {
    _FormularioNuevaCuenta.uid_update = uid_update;
    _FormularioNuevaCuenta.textControllerCorreo.text = email;
    _FormularioNuevaCuenta.textControllerPassword.text = password;
    _FormularioNuevaCuenta.fecha_compra = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(fecha_compra);
    _FormularioNuevaCuenta.dropdownProveedor = proveedor;
    _FormularioNuevaCuenta.seleccion_plataforma_streaming_valor =
        seleccion_plataforma_streaming_valor;
    _FormularioNuevaCuenta.seleccion_membresia_valor =
        seleccion_membresia_valor;
    _FormularioNuevaCuenta.dropdownPlataforma =
        seleccion_plataforma_streaming_valor;
    _FormularioNuevaCuenta.precio = precio;
    _FormularioNuevaCuenta.pagado = pagado;
  }

  static void limpiar_values() {
    _FormularioNuevaCuenta.uid_update = "";
    _FormularioNuevaCuenta.textControllerCorreo.text = "";
    _FormularioNuevaCuenta.textControllerPassword.text = "";
    _FormularioNuevaCuenta.fecha_compra = DateTime.now();
    _FormularioNuevaCuenta.dropdownProveedor = 'Ingrese un proveedor';
    _FormularioNuevaCuenta.seleccion_plataforma_streaming_valor = "";
    _FormularioNuevaCuenta.seleccion_membresia_valor ='Básico';
    _FormularioNuevaCuenta.dropdownPlataforma ='Netflix';
    _FormularioNuevaCuenta.precio = 0.00;
    _FormularioNuevaCuenta.pagado = false;
  }
  @override
  _FormularioNuevaCuenta createState() => _FormularioNuevaCuenta(lista);
}

class _FormularioNuevaCuenta extends State<FormularioNuevaCuentaInicio> {
  final _formKey = GlobalKey<FormState>();
  List<String> lista = null;
  _FormularioNuevaCuenta(List<String> lista){
    this.lista=lista;
  }

  var fireDatabase = FirebaseFirestore.instance.collection(Cuentas.TABLE_NAME);

  var fireauth = FirebaseAuth.instance.currentUser.uid;
  Cuentas cuenta;

 

  static String uid_update;
  static String email;
  static final textControllerCorreo = TextEditingController();
  static String password;
  static final textControllerPassword = TextEditingController();
  static DateTime fecha_compra;
  static String proveedor = "Ingrese un proveedor";
  static String seleccion_plataforma_streaming_valor;
  static String seleccion_membresia_valor;
  static double precio;
  static String dropdownMembresia = 'Básico';
  static String dropdownPlataforma = 'Netflix';
  static String dropdownProveedor = 'Ingrese un proveedor';
  static bool pagado = false;

  final List<String> seleccion_plataforma_streaming = [
    "Netflix",
    "Spotify",
    "Amazon Prime Video",
    "Disney Plus",
    "HBO GO",
    "YouTube"
  ];

  List<String> seleccion_membresia = [
    "Estándar",
    "Básico",
    "Premium",
    "Completa",
    "Pantalla",
    "Duo",
    "Familiar",
    "Estudiante"
  ];

  bool visibleMembresia = false;


  void _visibleMembresia(bool vMembresia) {
    visibleMembresia = vMembresia;
  }

  bool remember = false;

  int valor = 0;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        valor--;
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        valor++;
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    if(FormularioNuevaCuentaInicio.update){
      _visibleMembresia(true);
    }
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildFechaCompraSelectForm(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildProveedorFormDrop(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildSelecionarPlataformaStreamingFormDrop(),
          SizedBox(height: getProportionateScreenHeight(10)),
          Visibility(
              child: buildSeleccionarMembresiaFormDrop(),
              visible: visibleMembresia),
          Visibility(
              child: SizedBox(height: getProportionateScreenHeight(10)),
              visible: visibleMembresia),
          FormularioErroneo(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          BotomNuevosRegistros(
            text: "Registrar",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                cuenta = Cuentas(
                    correoElectronico: email,
                    contrasenia: password,
                    fechaCompra: DateFormat("yyyy-MM-dd hh:mm:ss").format(fecha_compra),
                    proveedor: proveedor,
                    plataforma: seleccion_plataforma_streaming_valor,
                    membresia: seleccion_membresia_valor,
                    precio: precio,
                    user: fireauth);

                if (FormularioNuevaCuentaInicio.update) {
                  cuenta.updateCuentas(fireDatabase, uid_update);
                } else {
                  cuenta.addCuentas(fireDatabase);
                }

                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: textControllerCorreo,
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidoEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidoEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Correo Electronico",
        hintText: "Escriba el correo electronico",
        // Si está utilizando la última versión de flutter, entonces el texto de la etiqueta y el texto de sugerencia se muestran así
        // si está usando flutter menos de 1.20. * entonces tal vez esto no esté funcionando correctamente
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSufijoTexto(svgIcon: "assets/icons/Icono Correo Electronico.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: textControllerPassword,
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kContrasenaNullError);
        } else if (value.length >= 8) {
          removeError(error: kContrasenaCortaError);
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kContrasenaNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kContrasenaCortaError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Contraseña",
        hintText: "Escriba la contraseña",
        // Si está utilizando la última versión de flutter, entonces el texto de la etiqueta y el texto de sugerencia se muestran así
        // si está usando flutter menos de 1.20. * entonces tal vez esto no esté funcionando correctamente
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSufijoTexto(svgIcon: "assets/icons/Icono Bloqueo.svg"),
      ),
    );
  }

  DateTimeFormField buildFechaCompraSelectForm() {
    return DateTimeFormField(
      initialValue: fecha_compra,
      label: "Fecha de Compra",
      formatter: new DateFormat("dd MMMM yyyy"),
      onSaved: (newValue) => fecha_compra = newValue,
      onlyDate: true,
      validator: (DateTime dateTime) {
        if (dateTime == null) {
          return "Date Time Required";
        }
        return null;
      },
    );
  }
  /*********************************---------------------Cliente - Proveedor----------------------***************************************/

  DropdownButtonFormField buildProveedorFormDrop() {
    return DropdownButtonFormField<String>(
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      value: lista.length == 1 ? 'Ingrese un proveedor':dropdownProveedor,
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {
          proveedor = newValue;
        });
      },
      items: lista.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
          labelText: "Proveedor",
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }

/**************************************************************-**********************************************************************/



  DropdownButtonFormField buildSelecionarPlataformaStreamingFormDrop() {
    return DropdownButtonFormField<String>(
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      value: dropdownPlataforma,
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {
          seleccion_plataforma_streaming_valor = newValue;

          if (newValue == "Netflix") {
            seleccion_membresia = ["Básico", "Estándar", "Premium"];
            dropdownMembresia = "Básico";
            _visibleMembresia(true);
          } else if (newValue == "Amazon Prime Video") {
            seleccion_membresia = ["Completa", "Pantalla"];
            dropdownMembresia = "Completa";
            _visibleMembresia(true);
          } else if (newValue == "Disney Plus") {
            seleccion_membresia = ["Completa", "Pantalla"];
            dropdownMembresia = "Completa";
            _visibleMembresia(true);
          } else if (newValue == "HBO GO") {
            seleccion_membresia = ["Completa", "Pantalla"];
            dropdownMembresia = "Completa";
            _visibleMembresia(true);
          } else if (newValue == "Spotify") {
            seleccion_membresia = ["Duo", "Premium", "Familiar", "Estudiante"];
            dropdownMembresia = "Duo";
            _visibleMembresia(true);
          } else if (newValue == "YouTube") {
            seleccion_membresia = ["Premium", "Familiar", "Estudiante"];
            dropdownMembresia = "Premium";
            _visibleMembresia(true);
          } else {
            _visibleMembresia(true);
          }
        });
      },
      items: seleccion_plataforma_streaming
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
          labelText: "Plataforma",
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }

  DropdownButtonFormField buildSeleccionarMembresiaFormDrop() {
    return DropdownButtonFormField<String>(

      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      value: dropdownMembresia,
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {
          seleccion_membresia_valor = newValue;
        });
      },
      items: seleccion_membresia.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
          labelText: "Membresia",
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }
}
