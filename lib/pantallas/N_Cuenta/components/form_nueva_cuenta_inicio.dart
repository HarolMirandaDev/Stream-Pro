
import 'package:flutter/material.dart';
import 'package:flutter_datetime_formfield/flutter_datetime_formfield.dart';
import 'package:shop_app/components/custom_boton_predeterminado.dart';
import 'package:shop_app/components/custom_formulario_erroneo.dart';
import 'package:shop_app/components/custom_sufijo_texto.dart';

import 'package:shop_app/pantallas/M_Inicio/pantalla_inicio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class FormularioNuevaCuentaInicio extends StatefulWidget {
  @override
  _FormularioNuevaCuentaInicio createState() => _FormularioNuevaCuentaInicio();

}

class _FormularioNuevaCuentaInicio extends State<FormularioNuevaCuentaInicio> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String conform_password;

  final List<String> tipo_servicio = ["Perfil","Cuenta"];
  String tipo_servicio_valor;

  final List<String> selecion_servicio = ["Netflix","Amazon","Disney","Spotify","HBO GO"];
  String selecion_servicio_valor;
  List<String> perfiles_1 = ["1","2","3","4","5"];
  String numero_perfiles;

  String precio;
  String fecha_compra;
  String fecha_venta;

  final List<String> clientes = ["juan","pedro","ulises","man","don pepe"];
  final List<String> proveedores = ["luis rancho","manuel","el chocas"];


  bool visible = false;
  String telefono;
  bool remember = false;

  int valor = 0;
  final List<String> errors = [];

  void _visible(bool b){
    visible = b;
  }
  
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
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTipoServicioFormDrop(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTipoServivioSelecionarFormDrop(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Visibility(
              child: buildNumCuentaSelectFormDrop(),
              visible: visible
          ),
          Visibility(
              child: SizedBox(height: getProportionateScreenHeight(30)),
              visible: visible
          ),
          //buildRedSocialFormDrop(),
          buildFechaCompraSelectForm(),
          SizedBox(height: getProportionateScreenHeight(30)),
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


  TextFormField buildEmailFormField() {
    return TextFormField(
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
        hintText: "Escriba su correo electronico",
        // Si está utilizando la última versión de flutter, entonces el texto de la etiqueta y el texto de sugerencia se muestran así
        // si está usando flutter menos de 1.20. * entonces tal vez esto no esté funcionando correctamente
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufijoTexto(
            svgIcon: "assets/icons/Icono Correo Electronico.svg"),
      ),
    );
  }


  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirmar Contraseña",
        hintText: "Escriba de nuevo su contraseña",
        // Si está utilizando la última versión de flutter, entonces el texto de la etiqueta y el texto de sugerencia se muestran así
        // si está usando flutter menos de 1.20. * entonces tal vez esto no esté funcionando correctamente
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufijoTexto(svgIcon: "assets/icons/Icono Bloqueo.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
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
        hintText: "Escriba su contraseña",
        // Si está utilizando la última versión de flutter, entonces el texto de la etiqueta y el texto de sugerencia se muestran así
        // si está usando flutter menos de 1.20. * entonces tal vez esto no esté funcionando correctamente
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufijoTexto(svgIcon: "assets/icons/Icono Bloqueo.svg"),
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



  DropdownButtonFormField buildTipoServicioFormDrop() {

    return DropdownButtonFormField<String>(
      value: tipo_servicio[0],
      elevation: 16,
      style: TextStyle(
          color: Colors.teal
      ),

      onChanged: (String newValue) {
        setState(() {
          tipo_servicio_valor = newValue;
        });
      },
      items: tipo_servicio
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
          decoration: InputDecoration(
          labelText: "Tipo de Cuenta",

          floatingLabelBehavior: FloatingLabelBehavior.always
        ),
    );

  }



  DropdownButtonFormField buildTipoServivioSelecionarFormDrop() {

    return DropdownButtonFormField<String>(
      value: selecion_servicio[0],
      elevation: 16,
      style: TextStyle(
          color: Colors.teal
      ),
      onChanged: (String newValue) {
        setState(() {
          selecion_servicio_valor = newValue;
          if(newValue == "Netflix"){
            perfiles_1 = ["1","2","3","4","5"];
            _visible(true);
          }else  if(newValue == "Amazon"){
            perfiles_1 = ["1","2","3","4","5","6"];
            _visible(true);
          }else  if(newValue == "Disney"){
            perfiles_1 = ["1","2","3","4","5","6","7"];
            _visible(true);
          }else if(newValue == "HBO GO"){
            perfiles_1 = ["2 pantallas"];
            _visible(true);
          }else{
            _visible(false);
          }
        });
      },
      items: selecion_servicio
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
          labelText: "Servicio",

          floatingLabelBehavior: FloatingLabelBehavior.always
      ),
    );

  }


  DropdownButtonFormField buildNumCuentaSelectFormDrop() {
    DropdownButtonFormField cmbo = DropdownButtonFormField<String>(
      value: perfiles_1[0],
      elevation: 16,
      style: TextStyle(
          color: Colors.teal
      ),

      onChanged: (String newValue) {
        setState(() {
          numero_perfiles = newValue;
        });

      },
      items: perfiles_1.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
          labelText: "Número de Cuentas",

          floatingLabelBehavior: FloatingLabelBehavior.always
      ),

    );
    return cmbo;

  }


  DateTimeFormField buildFechaCompraSelectForm() {
    return DateTimeFormField(
      initialValue: DateTime.now(),
      label: "Date Time",
      validator: (DateTime dateTime) {
        if (dateTime == null) {
          return "Date Time Required";
        }
        return null;
      },
    );
  }



}
