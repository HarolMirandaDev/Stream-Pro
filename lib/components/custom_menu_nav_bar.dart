import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_pro/screens/M_Clientes/pantalla_clientes.dart';
import 'package:stream_pro/screens/M_Proveedores/pantalla_proveedores.dart';
import 'package:stream_pro/screens/M_Cuentas/pantalla_cuentas.dart';
import 'package:stream_pro/screens/M_Usuario/pantalla_usuario.dart';

import '../config/constants.dart';
import '../config/enums.dart';

class CustomButtomNavBar extends StatelessWidget {
  const CustomButtomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(

        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -5),
            blurRadius: 10,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Icono Menu Inicio.svg",
                  color: MenuState.inicio == selectedMenu
                      ? kRosaMaterial
                      : inActiveIconColor,

                ),
                onPressed: () =>
                    null,
                ),

              IconButton(
                icon: SvgPicture.asset("assets/icons/Icono Menu Cuentas.svg",
                  color: MenuState.cuentas == selectedMenu
                      ? kAzulMaterial
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, PantallaCuentas.routeName),
              ),

              IconButton(
                icon: SvgPicture.asset("assets/icons/Icono Menu Clientes.svg",
                  color: MenuState.clientes == selectedMenu
                      ? kAzulMaterial
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, PantallaClientes.routeName),
              ),

              IconButton(
                icon: SvgPicture.asset("assets/icons/Icono Menu Proveedores.svg",
                  color: MenuState.proveedores == selectedMenu
                      ? kAzulMaterial
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, PantallaProveedores.routeName),
              ),

              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Icono Menu Usuario.svg",
                  color: MenuState.usuario == selectedMenu
                      ? kAzulMaterial
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, PantallaUsuario.routeName),
              ),
            ],
          )
      ),
    );
  }
}
