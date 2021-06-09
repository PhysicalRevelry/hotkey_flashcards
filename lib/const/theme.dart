import 'package:flutter/material.dart';

final ThemeData customTheme = ThemeData(
  primaryColor: Color(0xff567c79),
  accentColor: Color(0xff432546),
  scaffoldBackgroundColor: Color(0xffA39898),
  fontFamily: 'Montserrat',
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    buttonColor: Color(0xff567c79),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(),
);

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Color(0xff432546),
  minimumSize: Size(88, 36),
  padding: EdgeInsets.all(34),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
);
