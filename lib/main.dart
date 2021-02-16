import 'package:flutter/material.dart';
import 'routes.dart';
import 'pantallas/Bienvenida_Splash/pantalla_splash.dart';
import 'theme.dart';

void main() {
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
      // inicio: SplashScreen (),
      // Usamos routeName para que no necesitemos recordar el nombre
      initialRoute: PantallaSplash.routeName,
      routes: routes,
    );
  }
}
