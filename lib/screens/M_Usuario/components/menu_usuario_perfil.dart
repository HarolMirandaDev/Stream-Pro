import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_pro/screens/M_Inicio/components/inicio_campo_buscar.dart';

import '../../../config/constants.dart';

class UsuarioMenu extends StatelessWidget {
  const UsuarioMenu({
    Key key,
    @required this.text,
    @required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: Color(0xFF01579B),
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text, style: TextStyle(color: Color(0xFF01579B)),)),
            Icon(Icons.arrow_forward_ios, color: Color(0xFF01579B),),
          ],
        ),
      ),
    );
  }
}
