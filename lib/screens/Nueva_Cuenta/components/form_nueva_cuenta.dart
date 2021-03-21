
import 'package:flutter/material.dart';
import 'package:flutter_datetime_formfield/flutter_datetime_formfield.dart';
import 'package:intl/intl.dart';
import 'package:stream_pro/components/custom_boton_nuevos_registros.dart';
import 'package:stream_pro/components/custom_formulario_erroneo.dart';
import 'package:stream_pro/screens/M_Inicio/pantalla_inicio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';

class FormularioNuevaCuentaInicio extends StatefulWidget {
  @override
  _FormularioNuevaCuenta createState() => _FormularioNuevaCuenta();

}

class _FormularioNuevaCuenta extends State<FormularioNuevaCuentaInicio> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String conform_password;

  String proveedor = "Selecciona un Proveedor";
  String cliente = "Selecciona un Cliente";
  final List<String> proveedores = ["Selecciona","Crack","BinPro","Death"];
  final List<String> clientes= ["Selecciona","Juan","Pedro","Ulises","Daniela","Paola"];

  final List<String> seleccion_plataforma_streaming = ["Netflix","Spotify","Amazon Prime Video","Disney Plus","HBO GO","YouTube"];
  String seleccion_plataforma_streaming_valor;

  List<String> seleccion_membresia = ["Estándar","Básico","Premium","Completa","Pantalla","Duo","Familiar","Estudiante"];
  String seleccion_membresia_valor;

  bool visibleMembresia = false;


  void _visibleMembresia(bool vMembresia){
    visibleMembresia = vMembresia;
  }

  String fecha_compra;

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

          buildProveedorFormDrop(),
          SizedBox(height: getProportionateScreenHeight(20)),

          buildClienterFormDrop(),
          SizedBox(height: getProportionateScreenHeight(20)),

          buildSelecionarPlataformaStreamingFormDrop(),
          SizedBox(height: getProportionateScreenHeight(10)),

          Visibility(
              child: buildSeleccionarMembresiaFormDrop(),
              visible: visibleMembresia
          ),

          Visibility(
              child: SizedBox(height: getProportionateScreenHeight(10)),
              visible: visibleMembresia
          ),

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
                    fontSize: 22.0
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
      initialValue: DateTime.now(),
      label: "Fecha de Compra",
      formatter: new DateFormat("dd-MMMM-yyyy"),
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
      value: proveedores[0],
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {
          proveedor = newValue;
        });
      },
      items: proveedores
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
          labelText: "Proveedor",
          floatingLabelBehavior: FloatingLabelBehavior.always
      ),
    );

  }


  DropdownButtonFormField buildClienterFormDrop() {
    return DropdownButtonFormField<String>(
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      value: clientes[0],
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {
          cliente = newValue;
        });
      },
      items: clientes
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
          labelText: "Cliente",
          floatingLabelBehavior: FloatingLabelBehavior.always
      ),
    );

  }


/**************************************************************-**********************************************************************/
  DropdownButtonFormField buildSelecionarPlataformaStreamingFormDrop() {
    return DropdownButtonFormField<String>(
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      value: seleccion_plataforma_streaming[0],
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {
          seleccion_plataforma_streaming_valor = newValue;

          if(newValue == "Netflix"){
            seleccion_membresia = ["Básico","Estándar","Premium"];
            _visibleMembresia(true);
          } else

          if(newValue == "Amazon Prime Video"){
            seleccion_membresia = ["Completa","Pantalla"];
            _visibleMembresia(true);
          } else

          if(newValue == "Disney Plus"){
            seleccion_membresia = ["Completa","Pantalla"];
            _visibleMembresia(true);
          } else

          if(newValue == "HBO GO"){
            seleccion_membresia = ["Completa","Pantalla"];
            _visibleMembresia(true);
          } else

          if(newValue == "Spotify"){
            seleccion_membresia = ["Duo","Premium","Familiar","Estudiante"];

            _visibleMembresia(true);
          } else

          if(newValue == "YouTube"){
            seleccion_membresia = ["Premium","Familiar","Estudiante"];

            _visibleMembresia(true);
          } else

          {
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
          floatingLabelBehavior: FloatingLabelBehavior.always
      ),
    );
  }

  String dropdownMembresia = 'Premium';

  DropdownButtonFormField buildSeleccionarMembresiaFormDrop() {
    return DropdownButtonFormField<String>(
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      value: seleccion_membresia[0],
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {

        });
      },
      items: seleccion_membresia
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
          labelText: "Membresia",
          floatingLabelBehavior: FloatingLabelBehavior.always
      ),
    );
  }

}
