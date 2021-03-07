
import 'package:flutter/material.dart';
import 'package:flutter_datetime_formfield/flutter_datetime_formfield.dart';
import 'package:shop_app/components/custom_boton_nuevos_registros.dart';
import 'package:shop_app/components/custom_formulario_erroneo.dart';
import 'package:shop_app/pantallas/M_Inicio/pantalla_inicio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class FormularioNuevaCuentaInicio extends StatefulWidget {
  @override
  _FormularioNuevaCuenta createState() => _FormularioNuevaCuenta();

}

class _FormularioNuevaCuenta extends State<FormularioNuevaCuentaInicio> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String conform_password;

  String fecha_compra;

  final List<String> clientes = ["Juan","Pedro","Ulises","Daniela","Paola"];
  final List<String> proveedores = ["Crack","BinPro","Death"];

  String telefono;
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

          FormularioErroneo(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),

          BotomNuevosRegistros(
            text: "Registrar",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                Fluttertoast.showToast(
                    msg: "La cuenta ha sido registrada",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Color(0xff01579b),
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                Navigator.pushNamed(context, PantallaInicio.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
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
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
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
      initialValue: DateTime.now(),
      label: "Fecha de Compra",
      validator: (DateTime dateTime) {
        if (dateTime == null) {
          return "Date Time Required";
        }
        return null;
      },
    );
  }

}
