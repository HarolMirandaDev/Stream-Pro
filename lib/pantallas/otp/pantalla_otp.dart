import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

import 'components/cuerpo_otp.dart';

class PantallaOtp extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Body(),
    );
  }
}
