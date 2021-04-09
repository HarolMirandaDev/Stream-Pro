import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'config/routes.dart';
import 'screens/Bienvenida_Splash/pantalla_splash.dart';
import 'config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Este widget es la raíz de la aplicación.
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
