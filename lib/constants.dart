import 'package:flutter/material.dart';
import 'size_config.dart';

const kPrimaryColor = Color(0xFF006064);
const kPrimaryLightColor = Color(0xFFE0F7FA);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF00ACC1), Color(0xFF006064)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

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
const String kEmailNullError = "Por favor introduzca su correo electrónico";
const String kInvalidEmailError = "Por favor introduzca un correo electrónico válido";
const String kPassNullError = "Por favor, introduzca su contraseña";
const String kShortPassError = "La contraseña es demasiado corta";
const String kMatchPassError = "Las contraseñas no coinciden";
const String kNamelNullError = "Por favor, escriba su nombre";
const String kApodoNullError = "Por favor, escriba su apodo";

const String kLastNameNullError = "Por favor, escriba su apellido";
const String kPhoneNumberNullError = "Por favor, introduzca su número de teléfono";
const String kAddressNullError = "Ingrese su dirección";

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
