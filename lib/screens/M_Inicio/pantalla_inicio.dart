import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:shared_preferences_settings/shared_preferences_settings.dart';
import 'package:stream_pro/components/custom_menu_nav_bar.dart';
import 'package:stream_pro/config/enums.dart';
import 'package:stream_pro/config/guardado_preferences.dart';
import 'package:stream_pro/screens/CalculadoraTM/pantalla_calculadoraTigoMoney.dart';

import 'components/cuerpo_inicio.dart';

class PantallaInicio extends StatelessWidget {
  static String routeName = "/inicio";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("  Stream Pro"),
        backgroundColor: Theme.of(context).hoverColor,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.calculate),
            tooltip: 'Calculadora Tigo Money',
            onPressed: () {
              Navigator.pushNamed(context, PantallaCalculadoraTM.routeName);
            },
          ),
          IconButton(
            icon: Icon(Icons.help_center),
            tooltip: 'Enviar un correo a alonehadeshn@gmail.com',
            onPressed: () async {
              final Email email = Email(
                body: '',
                subject: '',
                recipients: ['alonehadeshn@gmail.com'],
              );
              await FlutterEmailSender.send(email);
            },
          ),
        ],
      ),
      body: Body(),
      bottomNavigationBar: CustomButtomNavBar(selectedMenu: MenuState.inicio),
    );
  }
}
