import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream_pro/components/custom_boton_nuevos_registros.dart';
import 'package:stream_pro/components/custom_formulario_erroneo.dart';
import 'package:stream_pro/models/Proveedores.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';

class FormularioNuevoProveedor extends StatefulWidget {
  static bool update = false;

  static void update_values(String apodo,String telefono, String red_social,String pais,String uid_update){
    _FormularioNuevoClienteInicio2.apodo = apodo;
    _FormularioNuevoClienteInicio2.dropdownValue = red_social;
    _FormularioNuevoClienteInicio2.dropdownValue2 = pais;
    _FormularioNuevoClienteInicio2.uid_update = uid_update;
    _FormularioNuevoClienteInicio2.textControllerTelefono.text = telefono;
  }

  @override
    _FormularioNuevoClienteInicio2 createState() => _FormularioNuevoClienteInicio2();
}

class _FormularioNuevoClienteInicio2 extends State<FormularioNuevoProveedor> {
  final _formKey = GlobalKey<FormState>();

  var fireDatabase = FirebaseFirestore.instance.collection(Proveedores.TABLE_NAME);
  var fireauth = FirebaseAuth.instance.currentUser.uid;
  Proveedores pro;

  static String apodo="";
  static String uid_update;
  static String cantida_cuentas="0";
  static String dropdownValue = 'Whatsapp';
  static String dropdownValue2 = 'Honduras';
  int id_proveedor;


  //TODO componente de telefono
  static String telefono;
  //Controllador del campo de texto para poder limpiarlo
  static final textControllerTelefono = TextEditingController();

  bool visible_format_honduras = true;
  bool visible_format_mexico = false;
  bool visible_format_colombia = false;

  void _visible_format_honduras(bool visible_format_honduras){
    this.visible_format_honduras = visible_format_honduras;
  }
  void _visible_format_mexico(bool visible_format_mexico){
    this.visible_format_mexico = visible_format_mexico;
  }
  void _visible_format_colombia(bool visible_format_colombia){
    this.visible_format_colombia = visible_format_colombia;
  }

  //TODO otros componentes
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
          SizedBox(height: getProportionateScreenHeight(20)),

          buildPaisFormDrop(),
          SizedBox(height: getProportionateScreenHeight(20)),

          Visibility(child: buildTelefonoFormHNDField(), visible: visible_format_honduras,),
          Visibility(child: buildTelefonoFormMXField(), visible: visible_format_mexico,),
          Visibility(child: buildTelefonoFormCOLField(), visible: visible_format_colombia,),
          SizedBox(height: getProportionateScreenHeight(20)),

          buildRedSocialFormDrop(),
          SizedBox(height: getProportionateScreenHeight(20)),

          buildNumCuentasFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),

          FormularioErroneo(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),

          StreamBuilder(
              stream: fireDatabase.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(snapshot.hasError){
                  return Text("Error en la base de datos");
                }
                switch(snapshot.connectionState){
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                    break;
                  default:
                    return BotomNuevosRegistros(
                      text: "Registrar",
                      press: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();


                          pro = Proveedores(nombre: apodo,
                                            pais: dropdownValue2,
                                            red_social: dropdownValue,
                                            telefono: telefono,
                                            user: fireauth);

                          String msg = "El proveedor "+ apodo +", ha sido registrado";
                          if(FormularioNuevoProveedor.update) {
                            fireDatabase.doc(uid_update).update(pro.toMap());
                            msg = "El proveedor "+ apodo +", ha sido actualizado";
                          } else {
                            fireDatabase.add(pro.toMap());
                          }

                          Fluttertoast.showToast(
                              msg: msg,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Color(0xff01579b),
                              textColor: Colors.white,
                              fontSize: 22.0
                          );
                          Navigator.pop(context);
                        }
                      },
                    );

                    break;
                }

              },
          )

        ],
      ),
    );
  }

  TextFormField buildApodoFormField() {
    return TextFormField(
      initialValue: apodo,
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
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

  TextFormField buildTelefonoFormMXField() {
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
      inputFormatters: [formatter_mex]
      ,
      decoration: InputDecoration(
        labelText: "Teléfono",
        hintText: "+52 ___-___-____",
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

  TextFormField buildTelefonoFormCOLField() {
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
      inputFormatters: [formatter_col]
      ,
      decoration: InputDecoration(
        labelText: "Teléfono",
        hintText: "+57 ____-___",
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


  DropdownButtonFormField buildPaisFormDrop() {
    return DropdownButtonFormField<String>(
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      value: dropdownValue2,
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue2 = newValue;
          if(newValue == "Honduras"){
            _visible_format_honduras(true);
            _visible_format_mexico(false);
            _visible_format_colombia(false);
            textControllerTelefono.clear();
          }else if(newValue == "Mexico"){
            _visible_format_honduras(false);
            _visible_format_mexico(true);
            _visible_format_colombia(false);
            textControllerTelefono.clear();
          }else{
            _visible_format_honduras(false);
            _visible_format_mexico(false);
            _visible_format_colombia(true);
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



  DropdownButtonFormField buildRedSocialFormDrop() {
    return DropdownButtonFormField<String>(
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      value: dropdownValue,
      elevation: 16,
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


  TextFormField buildNumCuentasFormField() {
    return TextFormField(
      initialValue: cantida_cuentas,
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      readOnly: true,
      onSaved: (newValue) => cantida_cuentas = newValue,
      decoration: InputDecoration(
        labelText: "Cantidad de Cuentas",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }


}
