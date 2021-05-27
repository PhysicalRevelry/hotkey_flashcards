import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.deepPurple,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat',
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.deepPurple,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.blueAccent,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

// ThemeData flashcardsTheme() {
//   TextTheme basicTextTheme(TextTheme base) {
//     return base.copyWith(
//       button: base.button.copyWith(
//         fontFamily: 'google_fonts/OpenSans-Regular.ttf',
//         fontSize: 25.0,
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
//
//   final ThemeData base = ThemeData.light();
//
//   return base.copyWith(
//     textTheme: basicTextTheme(base.textTheme),
//     // primaryColor: Color(0xffEA7822),
//     // buttonColor: Color(0xffEA7822),
//   );
// }
