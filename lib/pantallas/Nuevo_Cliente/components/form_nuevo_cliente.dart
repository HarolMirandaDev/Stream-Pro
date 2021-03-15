import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shop_app/components/custom_boton_nuevos_registros.dart';
import 'package:shop_app/components/custom_boton_predeterminado.dart';
import 'package:shop_app/components/custom_formulario_erroneo.dart';

import 'package:shop_app/components/custom_formulario_prueba.dart';

import 'package:shop_app/pantallas/M_Inicio/pantalla_inicio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

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

  final List<String> seleccion_plataforma_streaming = ["Netflix","Spotify","Amazon Prime Video","Disney Plus","HBO GO","YouTube"];
  String seleccion_plataforma_streaming_valor;

  List<String> seleccion_membresia = ["Estándar","Básico","Premium","Completa","Pantalla","Duo","Familiar","Estudiante"];
  String seleccion_membresia_valor;

  List<String> seleccion_cantidad_perfiles = ["1 Pantalla","2 Pantallas","3 Pantallas", "4 Pantallas", "5 Pantallas","6 Pantallas"];
  String seleccion_cantidad_perfiles_valor;

  String precio;

  int valor = 0;
  final List<String> errors = [];

  bool visibleMembresia = false;
  bool visibleCantidadPantallas = false;

  void _visibleMembresia(bool vMembresia){
    visibleMembresia = vMembresia;
  }

  void _visibleCantidadPantallas(bool vCantidadPantallas){
    visibleCantidadPantallas = vCantidadPantallas;
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

          Visibility(
              child: buildSeleccionarCantidadPantallasFormDrop(),
              visible: visibleCantidadPantallas
          ),

          Visibility(
              child: SizedBox(height: getProportionateScreenHeight(10)),
              visible: visibleCantidadPantallas
          ),

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


  TextFormField buildIdClienteFormField() {
    return TextFormField(
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      onSaved: (newValue) => apellido = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kLastNameNullError);
        }
        apellido = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kLastNameNullError);
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
          removeError(error: kNamelNullError);
        }
        nombre = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
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
            _visibleCantidadPantallas(false);
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
            _visibleCantidadPantallas(false);
            _visibleMembresia(true);
          } else

          if(newValue == "YouTube"){
            seleccion_membresia = ["Premium","Familiar","Estudiante"];
            _visibleCantidadPantallas(false);
            _visibleMembresia(true);
          } else

          {
            _visibleCantidadPantallas(false);
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
          seleccion_membresia_valor = newValue;

          if(newValue == "Pantalla" && seleccion_plataforma_streaming_valor=="Amazon Prime Video"){
            seleccion_cantidad_perfiles = ["1 Pantalla","2 Pantallas","3 Pantallas", "4 Pantallas", "5 Pantallas"];
            _visibleCantidadPantallas(true);
          } else

          if(newValue == "Pantalla" && seleccion_plataforma_streaming_valor=="Disney Plus"){
            seleccion_cantidad_perfiles = ["1 Pantalla","2 Pantallas","3 Pantallas", "4 Pantallas", "5 Pantallas", "6 Pantallas"];
            _visibleCantidadPantallas(true);
          } else

          if(newValue == "Pantalla" && seleccion_plataforma_streaming_valor=="HBO GO"){
            seleccion_cantidad_perfiles = ["1 Pantalla"];
            _visibleCantidadPantallas(true);
          } else

          if( seleccion_plataforma_streaming_valor=="HBO GO" && newValue == "Pantalla"){
            _visibleCantidadPantallas(false);
          } else

          if( seleccion_plataforma_streaming_valor=="Amazon Prime Video" && newValue == "Pantalla"){
            _visibleCantidadPantallas(false);
          } else

          if( seleccion_plataforma_streaming_valor=="Disney Plus" && newValue == "Completa"){
            _visibleCantidadPantallas(false);
          } else

          {
            _visibleCantidadPantallas(false);
            _visibleMembresia(true);
          }

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




  DropdownButtonFormField buildSeleccionarCantidadPantallasFormDrop() {
    DropdownButtonFormField cmbo = DropdownButtonFormField<String>(
      value: seleccion_cantidad_perfiles[0],
      elevation: 16,
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      onChanged: (String newValue) {
        setState(() {

        });
      },
      items: seleccion_cantidad_perfiles.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
          labelText: "Cantidad",
          floatingLabelBehavior: FloatingLabelBehavior.always
      ),
    );
    return cmbo;
  }

}
