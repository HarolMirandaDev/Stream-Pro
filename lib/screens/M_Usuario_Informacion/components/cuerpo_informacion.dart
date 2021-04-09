import 'package:flutter/material.dart';
import 'package:stream_pro/config/size_config.dart';


class CuerpoInformacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {




    return SafeArea(




      child: SizedBox(

        width: double.infinity,

        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(70),
            vertical: getProportionateScreenWidth(180),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(40),
            ),

            child: Column(

              children: [

                Divider(
                  height: 50,
                  thickness: 3,
                  indent: 30,
                  endIndent: 30,
                  color: Color(0xFF01579B),
                ),

                RichText(
                  textAlign:TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Stream Pro',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30,  ),
                      ),
                    ],

                  ),
                ),


                RichText(
                  textAlign:TextAlign.center,
                
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'v.1.0.3 - f.9.4.21',
                        style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 15,  ),
                      ),
                    ],

                  ),
                ),

                RichText(
                  textAlign:TextAlign.center,

                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Por: Harol Miranda',
                        style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 15,  ),
                      ),
                    ],

                  ),
                ),

                RichText(
                  textAlign:TextAlign.center,
                  text: TextSpan(

                    children: <TextSpan>[
                      TextSpan(text: '',

                        style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 15,  ),

                      ),
                    ],

                  ),
                ),

                Divider(
                  height: 50,
                  thickness: 3,
                  indent: 30,
                  endIndent: 30,
                  color: Color(0xFF01579B),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }



}


