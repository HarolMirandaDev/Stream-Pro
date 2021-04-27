import 'package:flutter/material.dart';
import 'package:shared_preferences_settings/shared_preferences_settings.dart';
import 'package:stream_pro/config/guardado_preferences.dart';

class Ajustes extends StatefulWidget {
  const Ajustes({key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Ajustes> {
  bool _DarkMode = false;
  bool _Notifications = false;

  @override
  Widget build(BuildContext context) {
    return SettingsContainer(
      children: [
        SwitchSettingsTile(
          settingKey: 'darkModw',
          title: 'Modo Noche',
        ),
        SwitchSettingsTile(
          settingKey: 'notificaciones',
          title: 'Notificaciones',
        ),
      ],
    );
  }
}
