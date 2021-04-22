import 'package:flutter/material.dart';

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

     return SingleChildScrollView(
       padding: EdgeInsets.symmetric(vertical: 20),
       child: Column(
         children: [
           SwitchListTile(
             title: const Text('Modo Nocturno',
               style: TextStyle(
                 color: Color(0xFF01579B),
               ),
             ),
             subtitle: const Text("Desea activar el modo nocturno?"),
             value: _DarkMode,
             onChanged: (bool value) {
               setState(() {
                 _DarkMode = value;
               });
             },
             secondary: const Icon(
                 Icons.wb_sunny, color: Color(0xFF01579B),
             ),
           ),

           SwitchListTile(

             title: const Text('Notificaciones',
               style: TextStyle(
                 color: Color(0xFF01579B),
              ),
             ),
             subtitle: const Text("Desea activar las notificaciones?"),
             value: _Notifications,
             onChanged: (bool value) {
               setState(() {
                 _Notifications = value;
               });
             },
             secondary: const Icon(
                 Icons.add_alert, color: Color(0xFF01579B),
             ),
           ),

         ],
       ),
     );
    }
  }


