import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:stream_pro/components/custom_boton_nuevos_registros.dart';
import 'package:stream_pro/components/custom_boton_predeterminado.dart';
import 'package:stream_pro/components/custom_formulario_erroneo.dart';

import 'package:stream_pro/components/custom_formulario_prueba.dart';

import 'package:stream_pro/screens/M_Inicio/pantalla_inicio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';

class FormularioNuevoCliente extends StatefulWidget {
  @override
  _FormularioNuevoCliente createState() => _FormularioNuevoCliente();
}

class _FormularioNuevoCliente extends State<FormularioNuevoCliente> {
  final _formKey = GlobalKey<FormState>();

  String nombre;
  String apellido;

  //TODO componente de telefono
  String telefono;
  //Controllador del campo de texto para poder limpiarlo
  final textControllerTelefono = TextEditingController();
  bool visible_format_honduras = true;
  bool visible_format_inglaterra = false;
  bool visible_format_espania = false;

  void _visible_format_honduras(bool visible_format_honduras){
    this.visible_format_honduras = visible_format_honduras;
  }
  void _visible_format_inglaterra(bool visible_format_inglaterra){
    this.visible_format_inglaterra = visible_format_inglaterra;
  }
  void _visible_format_espania(bool visible_format_espania){
    this.visible_format_espania = visible_format_espania;
  }


  //TODO otros componentes
  bool remember = false;
  String fecha_compra;

  final List<String> correo_cuenta = ["alone@yopmail.com","pascual@yopmail.com","mordaza@yopmail.com"];

  final List<String> pais = ["Honduras","Inglaterra","España"];

  String precio;

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
          buildNombreClienteFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),

          buildPaisClienteFormDrop(),
          SizedBox(height: getProportionateScreenHeight(10)),

          Visibility(child: buildTelefonoFormHNDField(), visible: visible_format_honduras,),
          Visibility(child: buildTelefonoFormINGField(), visible: visible_format_inglaterra,),
          Visibility(child: buildTelefonoFormSPAField(), visible: visible_format_espania,),

          SizedBox(height: getProportionateScreenHeight(10)),

          buildCorreoCuentaFormDrop(),
          SizedBox(height: getProportionateScreenHeight(10)),



          FormularioErroneo(errors: errors),
          SizedBox(height: getProportionateScreenHeight(15)),

          BotomNuevosRegistros(
            text: "Registrar",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                Fluttertoast.showToast(
                    msg: "El cliente "+ nombre +", ha sido registrado",
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


  TextFormField buildIdClienteFormField() {
    return TextFormField(
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      onSaved: (newValue) => apellido = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kApellidoNullError);
        }
        apellido = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kApellidoNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Código Cliente",
        hintText: "CLI0001",
        // Si está utilizando la última versión de flutter, entonces el texto de la etiqueta y el texto de sugerencia se muestran así
        // si está usando flutter menos de 1.20. * entonces tal vez esto no esté funcionando correctamente
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildNombreClienteFormField() {
    return TextFormField(
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      onSaved: (newValue) => nombre = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNombreNullError);
        }
        nombre = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNombreNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Nombre",
        hintText: "Escriba el nombre",
        // Si está utilizando la última versión de flutter, entonces el texto de la etiqueta y el texto de sugerencia se muestran así
        // si está usando flutter menos de 1.20. * entonces tal vez esto no esté funcionando correctamente
        floatingLabelBehavior: FloatingLabelBehavior.always,
        /*suffixIcon:
          Icon(
            Icons.assignment_ind,
            color: Colors.teal,
            size: 36.0,
          )*/
      ),
    );
  }

  String dropdownValue2 = 'Honduras';

  DropdownButtonFormField buildPaisClienteFormDrop() {
    return DropdownButtonFormField<String>(
      value: dropdownValue2,
      elevation: 16,
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue2 = newValue;
          if(newValue == "Honduras"){
            _visible_format_honduras(true);
            _visible_format_inglaterra(false);
            _visible_format_espania(false);
            textControllerTelefono.clear();
          }else if(newValue == "Inglaterra"){
            _visible_format_honduras(false);
            _visible_format_inglaterra(true);
            _visible_format_espania(false);
            textControllerTelefono.clear();
          }else{
            _visible_format_honduras(false);
            _visible_format_inglaterra(false);
            _visible_format_espania(true);
            textControllerTelefono.clear();
          }
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

  /********************------------------------Telefono--------------------------**************************/
  TextFormField buildTelefonoFormHNDField() {
    return TextFormField(
      controller: textControllerTelefono,
        style: TextStyle(
          color: Color(0xff01579b),
          fontSize: 18,
        ),
      onSaved: (newValue) => telefono = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kTelefonoNullError);
        }
        telefono = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kTelefonoNullError);
          return "";
        }
        return null;
      },
      inputFormatters: [formatter_hnd]
       ,
      decoration: InputDecoration(
        labelText: "Teléfono",
        hintText: "+504 ____-____",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
          SizedBox(
              width: 48,
              height: 48,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(

                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    child: const Icon(Icons.clear, color: Colors.grey, size: 24),
                    onTap: () => textControllerTelefono.clear()
                ),
              )
          ),
      ),
    );
  }

  TextFormField buildTelefonoFormINGField() {
    return TextFormField(
      controller: textControllerTelefono,
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      onSaved: (newValue) => telefono = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kTelefonoNullError);
        }
        telefono = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kTelefonoNullError);
          return "";
        }
        return null;
      },
      inputFormatters: [formatter_ing]
      ,
      decoration: InputDecoration(
        labelText: "Teléfono",
        hintText: "+44 ____-____-___",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
        SizedBox(
            width: 48,
            height: 48,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(

                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: const Icon(Icons.clear, color: Colors.grey, size: 24),
                  onTap: () => textControllerTelefono.clear()
              ),
            )
        ),
      ),
    );
  }

  TextFormField buildTelefonoFormSPAField() {
    return TextFormField(
      controller: textControllerTelefono,
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      onSaved: (newValue) => telefono = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kTelefonoNullError);
        }
        telefono = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kTelefonoNullError);
          return "";
        }
        return null;
      },
      inputFormatters: [formatter_esp]
      ,
      decoration: InputDecoration(
        labelText: "Teléfono",
        hintText: "+34 ___-___-___",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
        SizedBox(
            width: 48,
            height: 48,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(

                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: const Icon(Icons.clear, color: Colors.grey, size: 24),
                  onTap: () => textControllerTelefono.clear()
              ),
            )
        ),
      ),
    );
  }



  /********************------------------------Telefono--------------------------**************************/


  String dropdownValueCorreo = 'alone@yopmail.com';

  DropdownButtonFormField buildCorreoCuentaFormDrop() {
    return DropdownButtonFormField<String>(
      value: dropdownValueCorreo,
      elevation: 16,
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValueCorreo = newValue;

        });
      },
      items: correo_cuenta
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
          labelText: "Correo",

          floatingLabelBehavior: FloatingLabelBehavior.always
      ),
    );
  }



}
