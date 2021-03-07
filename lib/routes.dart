import 'package:flutter/widgets.dart';
import 'package:shop_app/pantallas/M_Usuario_Mi_Cuenta/pantalla_mi_cuenta.dart';
import 'package:shop_app/pantallas/Nuevo_Cliente/pantalla_nuevo_cliente_inicio.dart';
import 'package:shop_app/pantallas/Nuevo_Proveedor/pantalla_nuevo_proveedor_inicio.dart';
import 'package:shop_app/pantallas/Nueva_Cuenta/pantalla_nueva_cuenta_inicio.dart';

import 'pantallas/Bienvenida_Splash/pantalla_splash.dart';
import 'pantallas/usuario_registro/pantalla_usuario_registro.dart';
import 'pantallas/usuario_inicio_sesion/pantalla_usuario_inicio_sesion.dart';
import 'pantallas/usuario_perfil_completado/pantalla_usuario_perfil_completado.dart';
import 'pantallas/Usuario_Recuperar_Contrasena/pantalla_usuario_olvido_contrasena.dart';
import 'pantallas/usuario_inicio_sesion_exitosa/pantalla_usuario_inicio_sesion_exitosa.dart';
import 'pantallas/otp/pantalla_otp.dart';

import 'pantallas/M_Inicio/pantalla_inicio.dart';
import 'pantallas/M_Clientes/pantalla_clientes.dart';
import 'pantallas/M_Cuentas/pantalla_cuentas.dart';
import 'pantallas/M_Proveedores/pantalla_proveedores.dart';
import 'pantallas/M_Usuario/pantalla_usuario.dart';

import 'pantallas/M_Usuario_Mi_Cuenta/pantalla_mi_cuenta.dart';
import 'pantallas/M_Usuario_Ayuda/pantalla_ayuda.dart';

// Uso de ruta
// Todas nuestras rutas estarán disponibles aquí
final Map<String, WidgetBuilder> routes = {
  PantallaSplash.routeName: (context) => PantallaSplash(),
  PantallaUsuarioInicioSesion.routeName: (context) => PantallaUsuarioInicioSesion(),
  PantallaUsuarioOlvidoContrasena.routeName: (context) => PantallaUsuarioOlvidoContrasena(),
  PantallaUsuarioInicioSesionExitosa.routeName: (context) => PantallaUsuarioInicioSesionExitosa(),
  PantallaUsuarioRegistro.routeName: (context) => PantallaUsuarioRegistro(),
  PantallaUsuarioPerfilCompletado.routeName: (context) => PantallaUsuarioPerfilCompletado(),
  PantallaOtp.routeName: (context) => PantallaOtp(),

  PantallaInicio.routeName: (context) => PantallaInicio(),

  PantallaNuevoClienteInicio.routeName: (context) => PantallaNuevoClienteInicio(),
  PantallaNuevoProveedorInicio.routeName: (context) => PantallaNuevoProveedorInicio(),
  PantallaNuevaCuentaInicio.routeName: (context) => PantallaNuevaCuentaInicio(),

  PantallaCuentas.routeName: (context) => PantallaCuentas(),
  PantallaClientes.routeName: (context) => PantallaClientes(),
  PantallaProveedores.routeName: (context) => PantallaProveedores(),
  PantallaUsuario.routeName: (context) => PantallaUsuario(),

  PantallaMiCuenta.routeName: (context) => PantallaMiCuenta(),
  PantallaAyuda.routeName: (context) => PantallaAyuda(),
};
