import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stream_pro/components/custom_boton_predeterminado.dart';
import 'package:stream_pro/components/custom_sufijo_texto.dart';
import 'package:stream_pro/components/custom_formulario_erroneo.dart';
import 'package:stream_pro/helper/teclado.dart';
import 'package:stream_pro/screens/Usuario_Recuperar_Contrasena/pantalla_usuario_olvido_contrasena.dart';
import 'package:stream_pro/screens/Usuario_Inicio_Sesion_Exitosa/pantalla_usuario_inicio_sesion_exitosa.dart';

import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
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
          FormularioErroneo(errors: errors),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Recordar"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, PantallaUsuarioOlvidoContrasena.routeName),
                child: Text(
                  "Ha olvidado su contraseña",
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          BotonPredeterminado(
            text: "Continuar",
            press: () {

              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, PantallaUsuarioInicioSesionExitosa.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kContrasenaNullError);
        } else if (value.length >= 8) {
          removeError(error: kContrasenaCortaError);
        }
        return null;
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
        hintText: "Ingrese su contraseña",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufijoTexto(svgIcon: "assets/icons/Icono Bloqueo.svg"),
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
        hintText: "Ingrese su correo electronico",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufijoTexto(svgIcon: "assets/icons/Icono Correo Electronico.svg"),
      ),
    );
  }
}
