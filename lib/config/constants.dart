import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:stream_pro/config/size_config.dart';

const kPrimaryColor = Color(0xFF006064);
const kPrimaryLightColor = Color(0xFFE0F7FA);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF00ACC1), Color(0xFF006064)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kRosaMaterial = Color(0xFFAD1457);
const kAzulMaterial = Color(0xff01579b);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Por favor introduzca el correo electrónico";
const String kInvalidEmailError = "Por favor introduzca un correo electrónico válido";
const String kPassNullError = "Por favor, introduzca la contraseña";
const String kShortPassError = "La contraseña es demasiado corta";
const String kMatchPassError = "Las contraseñas no coinciden";
const String kNamelNullError = "Por favor, escriba el nombre";
const String kApodoNullError = "Por favor, escriba el apodo";

const String kLastNameNullError = "Por favor, escriba el apellido";
const String kPhoneNumberNullError = "Por favor, introduzca el número de teléfono";
const String kAddressNullError = "Ingrese la dirección";

//TODO fomatos de telefonos

MaskTextInputFormatter formatter_hnd = MaskTextInputFormatter(mask:  "+504 ####-####");
MaskTextInputFormatter formatter_esp = MaskTextInputFormatter(mask:  "+34 ###-###-###");
MaskTextInputFormatter formatter_ing = MaskTextInputFormatter(mask:  "+44 ####-####-###");
MaskTextInputFormatter formatter_mex = MaskTextInputFormatter(mask:  "+52 ###-###-####");
MaskTextInputFormatter formatter_col = MaskTextInputFormatter(mask:  "+57 ####-###");

/**final formatos*/
final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
