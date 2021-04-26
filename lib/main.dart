import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stream_pro/Notificacion.dart';
import 'config/routes.dart';
import 'screens/Bienvenida_Splash/pantalla_splash.dart';
import 'config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  Stream_pro createState() => new Stream_pro();
}

class Stream_pro extends State<MyApp>{
  // Este widget es la raíz de la aplicación.
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stream Pro',
      theme: theme(),
      // Usamos routeName para que no necesitemos recordar el nombre
      initialRoute: PantallaSplash.routeName,
      routes: routes,
    );
  }
  
}
