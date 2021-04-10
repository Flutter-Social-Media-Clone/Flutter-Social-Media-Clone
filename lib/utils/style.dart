import 'package:flutter/material.dart';

ButtonStyle login_signupButtonStyle = OutlinedButton.styleFrom(
  elevation: 10,
  shadowColor: Color.fromRGBO(220, 220, 220, 0.7),
  backgroundColor: Color.fromRGBO(250, 250, 250, 0.8),
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(45))),
);
TextStyle login_signupButtonTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 18,
);

TextStyle headerGradient = TextStyle(
  fontSize: 64,
  fontWeight: FontWeight.w400,
  foreground: Paint()
    ..shader = LinearGradient(
      colors: <Color>[
        Color.fromRGBO(48, 207, 208, 1.0),
        Color.fromRGBO(51, 8, 103, 1.0)
      ],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 20.0)),
);

BoxDecoration backgroundDecoration = BoxDecoration(
    image: DecorationImage(
  image: AssetImage("assets/images/login_background.png"),
  fit: BoxFit.fitHeight,
));
