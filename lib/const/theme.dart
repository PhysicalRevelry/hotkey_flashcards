import 'package:flutter/material.dart';

final ThemeData customTheme = ThemeData(
  primaryColor: Color(0xff567c79),
  accentColor: Color(0xff432546),
  scaffoldBackgroundColor: Color(0xffEAF0EA),
  fontFamily: 'Montserrat',
  textTheme: TextTheme(
    headline1: TextStyle(
      fontFamily: 'alegreyaSans',
      fontSize: 55,
      fontWeight: FontWeight.w900,
      color: Color(0xff432546),
    ),
    subtitle1: TextStyle(
      fontFamily: 'josephineSans',
      fontSize: 35,
      color: Colors.black54,
    ),
    subtitle2: TextStyle(
      fontFamily: 'josephineSans',
      fontSize: 45,
      color: Colors.black54,
    ),
    bodyText1: TextStyle(
      fontFamily: 'roboto',
      fontSize: 20,
      color: Colors.black87,
    )

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
