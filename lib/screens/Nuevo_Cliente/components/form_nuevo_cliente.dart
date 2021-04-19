import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_formfield/flutter_datetime_formfield.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:stream_pro/components/custom_boton_nuevos_registros.dart';
import 'package:stream_pro/components/custom_formulario_erroneo.dart';
import 'package:stream_pro/models/Clientes.dart';
import 'package:stream_pro/models/Cuentas.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';

class FormularioNuevoCliente extends StatefulWidget {
  List<String> lista_cuentas;

  FormularioNuevoCliente(List<String> lista_cuentas) {
    this.lista_cuentas = lista_cuentas;
  }

  static bool update = false;

  static void update_values(String nombre, String pais, String correo,
      String telefono, String fecha_venta,String pago, String uid_update) {
    _FormularioNuevoCliente.uid_update = uid_update;
    _FormularioNuevoCliente.textControllerNombre.text = nombre;
    _FormularioNuevoCliente.dropdownPais = pais;
    _FormularioNuevoCliente.dropdownValueCorreo = correo;
    _FormularioNuevoCliente.textControllerTelefono.text = telefono;
    _FormularioNuevoCliente.fecha_venta =
        new DateFormat("dd/MMMM/yy").parse(fecha_venta);
    _FormularioNuevoCliente.pago = pago;
  }

  static void limpiar_values() {
    _FormularioNuevoCliente.uid_update = "";
    _FormularioNuevoCliente.textControllerNombre.text = "";
    _FormularioNuevoCliente.dropdownPais = 'Honduras';
    _FormularioNuevoCliente.dropdownValueCorreo = 'Ingrese una cuenta';
    _FormularioNuevoCliente.textControllerTelefono.text = "";
    _FormularioNuevoCliente.fecha_venta = DateTime.now();
    FormularioNuevoCliente.update = false;
    _FormularioNuevoCliente.pago = 'false';
  }

  @override
  _FormularioNuevoCliente createState() =>
      _FormularioNuevoCliente(lista_cuentas);
}

class _FormularioNuevoCliente extends State<FormularioNuevoCliente> {
  final _formKey = GlobalKey<FormState>();
  static String uid_update;
  var fireDatabase = FirebaseFirestore.instance.collection(Clientes.TABLE_NAME);
  var fireauth = FirebaseAuth.instance.currentUser.uid;
  Clientes cli;

  List<String> correo_cuenta = null;

  static String nombre;
  static String dropdownPais = 'Honduras';
  static String dropdownValueCorreo = 'Ingrese una cuenta';
  static String pago = 'false';
  static DateTime fecha_venta = DateTime.now();

  //TODO componente de telefono
  static String telefono;

  //Controllador del campo de texto para poder limpiarlo
  static final textControllerTelefono = TextEditingController();
  static final textControllerNombre = TextEditingController();

  bool visible_format_honduras = true;
  bool visible_format_inglaterra = false;
  bool visible_format_espania = false;

  _FormularioNuevoCliente(List<String> lista_cuentas) {
    this.correo_cuenta = lista_cuentas;
  }

  void _visible_format_honduras(bool visible_format_honduras) {
    this.visible_format_honduras = visible_format_honduras;
  }

  void _visible_format_inglaterra(bool visible_format_inglaterra) {
    this.visible_format_inglaterra = visible_format_inglaterra;
  }

  void _visible_format_espania(bool visible_format_espania) {
    this.visible_format_espania = visible_format_espania;
  }

  //TODO otros componentes
  bool remember = false;

  final List<String> pais = ["Honduras", "Inglaterra", "España"];

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
          Visibility(
            child: buildTelefonoFormHNDField(),
            visible: visible_format_honduras,
          ),
          Visibility(
            child: buildTelefonoFormINGField(),
            visible: visible_format_inglaterra,
          ),
          Visibility(
            child: buildTelefonoFormSPAField(),
            visible: visible_format_espania,
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          builCorreo(),
          buildCorreoCuentaFormDrop(),
          SizedBox(height: getProportionateScreenHeight(10)),
          buildFechaVentaSelectForm(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormularioErroneo(errors: errors),
          SizedBox(height: getProportionateScreenHeight(15)),
          BotomNuevosRegistros(
            text: "Registrar",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                cli = Clientes(
                    nombre: nombre,
                    pais: dropdownPais,
                    correo_electronico: dropdownValueCorreo,
                    fecha_ventas: DateFormat("dd/MMMM/yy").format(fecha_venta),
                    fecha_renovacion: DateFormat("dd/MMMM/yy").format(new DateTime(fecha_venta.year,fecha_venta.month+1,fecha_venta.day)),
                    telefono: telefono,
                    pago: pago,
                    user: fireauth);

                if (FormularioNuevoCliente.update) {
                  cli.updateClientes(fireDatabase, uid_update);
                } else {
                  cli.addClientes(fireDatabase);
                }

                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  StreamBuilder builCorreo() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(Cuentas.TABLE_NAME)
          .where("user", isEqualTo: FirebaseAuth.instance.currentUser.uid)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Error en la base de datos");
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
            break;
          default:
            return Builder(
              builder: (context) {
                correo_cuenta.clear();
                correo_cuenta.add('Ingrese una cuenta');
                for (int i = 0; i < snapshot.data.size; i++) {
                  if (snapshot.data.docs[i].data()['user'] ==
                      FirebaseAuth.instance.currentUser.uid) {
                    correo_cuenta
                        .add(snapshot.data.docs[i].data()["correoElectronico"]);
                  }
                }
                return Container();
              },
            );
            break;
        }
      },
    );
  }

  TextFormField buildNombreClienteFormField() {
    return TextFormField(
      controller: textControllerNombre,
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

  DropdownButtonFormField buildPaisClienteFormDrop() {
    return DropdownButtonFormField<String>(
      value: dropdownPais,
      elevation: 16,
      style: TextStyle(
        color: Color(0xff01579b),
        fontSize: 18,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownPais = newValue;
          if (newValue == "Honduras") {
            _visible_format_honduras(true);
            _visible_format_inglaterra(false);
            _visible_format_espania(false);
            textControllerTelefono.clear();
          } else if (newValue == "Inglaterra") {
            _visible_format_honduras(false);
            _visible_format_inglaterra(true);
            _visible_format_espania(false);
            textControllerTelefono.clear();
          } else {
            _visible_format_honduras(false);
            _visible_format_inglaterra(false);
            _visible_format_espania(true);
            textControllerTelefono.clear();
          }
        });
      },
      items: pais.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
          labelText: "País",
          floatingLabelBehavior: FloatingLabelBehavior.always),
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
      inputFormatters: [formatter_hnd],
      decoration: InputDecoration(
        labelText: "Teléfono",
        hintText: "+504 ____-____",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: SizedBox(
            width: 48,
            height: 48,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: const Icon(Icons.clear, color: Colors.grey, size: 24),
                  onTap: () => textControllerTelefono.clear()),
            )),
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
      inputFormatters: [formatter_ing],
      decoration: InputDecoration(
        labelText: "Teléfono",
        hintText: "+44 ____-____-___",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: SizedBox(
            width: 48,
            height: 48,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: const Icon(Icons.clear, color: Colors.grey, size: 24),
                  onTap: () => textControllerTelefono.clear()),
            )),
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
      inputFormatters: [formatter_esp],
      decoration: InputDecoration(
        labelText: "Teléfono",
        hintText: "+34 ___-___-___",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: SizedBox(
            width: 48,
            height: 48,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: const Icon(Icons.clear, color: Colors.grey, size: 24),
                  onTap: () => textControllerTelefono.clear()),
            )),
      ),
    );
  }

  /********************------------------------Telefono--------------------------**************************/

  DropdownButtonFormField buildCorreoCuentaFormDrop() {
    try {
      return DropdownButtonFormField<String>(
        value: correo_cuenta.length == 0
            ? 'Ingrese una cuenta'
            : dropdownValueCorreo,
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
        items: correo_cuenta.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: InputDecoration(
            labelText: "Correo",
            floatingLabelBehavior: FloatingLabelBehavior.always),
      );
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Color(0xff01579b),
          textColor: Colors.white,
          fontSize: 22.0);
    }
  }

  DateTimeFormField buildFechaVentaSelectForm() {
    //Locale locale = new Locale("es", "ES");
    return DateTimeFormField(
      initialValue: fecha_venta,
      label: "Fecha de Venta",
      formatter: new DateFormat("dd/MMMM/yy"),
      onlyDate: true,
      validator: (DateTime dateTime) {
        if (dateTime == null) {
          return "Date Time Required";
        }
        return null;
      },
    );
  }
}
