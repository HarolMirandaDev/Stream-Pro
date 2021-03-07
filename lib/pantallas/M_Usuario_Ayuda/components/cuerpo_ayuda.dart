import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

import 'ver_ayuda.dart';

class BodyAyuda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Ayuda", style: headingStyle),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }



}


