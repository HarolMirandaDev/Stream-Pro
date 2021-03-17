import 'package:flutter/material.dart';
import 'package:stream_pro/components/custom_menu_nav_bar.dart';
import 'package:stream_pro/config/enums.dart';

import 'components/cuerpo_inicio.dart';

class PantallaInicio extends StatelessWidget {
  static String routeName = "/inicio";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Body(),
      bottomNavigationBar: CustomButtomNavBar(
          selectedMenu: MenuState.inicio
      ),
    );
  }
}
