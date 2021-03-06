import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_boton_predeterminado.dart';
import 'package:shop_app/components/custom_formulario_erroneo.dart';

import 'package:shop_app/components/custom_formulario_prueba.dart';

import 'package:shop_app/pantallas/M_Inicio/pantalla_inicio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class FormularioNuevoClienteInicio2 extends StatefulWidget {
  @override
  _FormularioNuevoClienteInicio2 createState() => _FormularioNuevoClienteInicio2();
}

class _FormularioNuevoClienteInicio2 extends State<FormularioNuevoClienteInicio2> {
  final _formKey = GlobalKey<FormState>();
  String apodo;
  String telefono;
  bool remember = false;
  final List<String> pais = ["Honduras","Mexico","Colombia"];
  final List<String> red_social = ["Whatsapp","Telegram","Ambos"];
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
      child:

      Column(
        children: [
          buildApodoFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTelefonoFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPaisFormDrop(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildRedSocialFormDrop(),
          FormularioErroneo(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          BotonPredeterminado(
            text: "Guardar",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                Fluttertoast.showToast(
                    msg: "Registrado con exito.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.teal,
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

  TextFormField buildApodoFormField() {
    return TextFormField(
      onSaved: (newValue) => apodo = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kApodoNullError);
        }
        apodo = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kApodoNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Apodo",
        hintText: "Escriba su apodo",
        // Si está utilizando la última versión de flutter, entonces el texto de la etiqueta y el texto de sugerencia se muestran así
        // si está usando flutter menos de 1.20. * entonces tal vez esto no esté funcionando correctamente
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
          Icon(
            Icons.account_circle,
            color: Colors.teal,
            size: 36.0,
          )
      ),
    );
  }

  TextFormField buildTelefonoFormField() {
    return TextFormField(
      onSaved: (newValue) => telefono = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        telefono = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Teléfono",
        hintText: "Escriba su teléfono",
        // Si está utilizando la última versión de flutter, entonces el texto de la etiqueta y el texto de sugerencia se muestran así
        // si está usando flutter menos de 1.20. * entonces tal vez esto no esté funcionando correctamente
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
        Icon(
          Icons.phone,
          color: Colors.teal,
          size: 36.0,
        )
      )
    );
  }

  String dropdownValue2 = 'Honduras';

  DropdownButtonFormField buildPaisFormDrop() {

    return DropdownButtonFormField<String>(
      value: dropdownValue2,
      elevation: 16,
      style: TextStyle(
          color: Colors.teal
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue2 = newValue;
        });
      },
      items: pais
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
          labelText: "País",

          floatingLabelBehavior: FloatingLabelBehavior.always
      ),
    );

  }

  String dropdownValue = 'Whatsapp';

  DropdownButtonFormField buildRedSocialFormDrop() {

    return DropdownButtonFormField<String>(
      value: dropdownValue,
      elevation: 16,
      style: TextStyle(
          color: Colors.teal
      ),

      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: red_social
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
          decoration: InputDecoration(
          labelText: "Red Social",

          floatingLabelBehavior: FloatingLabelBehavior.always
        ),
    );

  }

}
