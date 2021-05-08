import 'package:flutter/material.dart';

ButtonStyle login_signupButtonStyle = OutlinedButton.styleFrom(
  elevation: 10,
  shadowColor: Color.fromRGBO(220, 220, 220, 0.7),
  backgroundColor: Color.fromRGBO(250, 250, 250, 0.8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(45),
    ),
  ),
);
TextStyle login_signupButtonTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 18,
);

ButtonStyle subs_ButtonStyle = OutlinedButton.styleFrom(
  elevation: 5,
  shadowColor: Color.fromRGBO(220, 220, 220, 0.7),
  backgroundColor: Color.fromRGBO(250, 250, 250, 0.8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
  ),
);
TextStyle subs_ButtonTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 15,
);


ButtonStyle unf_ButtonStyle = OutlinedButton.styleFrom(
  elevation: 5,
  shadowColor: Color.fromRGBO(18, 52, 86, 1.0),
  backgroundColor: Color.fromRGBO(18, 52, 86, 1.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
  ),
);
TextStyle unf_ButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 15,
);




ButtonStyle profile_ButtonStyle = OutlinedButton.styleFrom(
  elevation: 10,
  shadowColor: Color.fromRGBO(220, 220, 220, 0.7),
  backgroundColor: Color.fromRGBO(250, 250, 250, 0.8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);
TextStyle profile_ButtonTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 14,
);

ButtonStyle hiddenprofile_ButtonStyle = OutlinedButton.styleFrom(
  elevation: 10,
  shadowColor: Color.fromRGBO(220, 220, 220, 0.7),
  backgroundColor: Color.fromRGBO(250, 250, 250, 0.8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
);
TextStyle hiddenprofile_ButtonTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20,
);






TextStyle searchResultTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.black,
  fontWeight: FontWeight.w600,
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
TextStyle headerG = TextStyle(
  fontSize: 45,
  fontWeight: FontWeight.w400,
  foreground: Paint()
    ..shader = LinearGradient(
      colors: <Color>[
        Color.fromRGBO(48, 207, 208, 1.0),
        Color.fromRGBO(51, 8, 103, 1.0)
      ],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 20.0)),
);
TextStyle ChangeP = TextStyle(
  fontSize: 44,
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

TextStyle walkthroughScreenHeader = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

TextStyle walkthroughScreenSubHeader = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w300,
  color: Colors.white,
);

EdgeInsets loginSignupMargin = EdgeInsets.fromLTRB(0, 45, 0, 25);
EdgeInsets loginSignupPadding = EdgeInsets.fromLTRB(25, 105, 25, 45);
EdgeInsets walkthroughPadding = EdgeInsets.fromLTRB(0, 20, 0, 0);

TextStyle notificationDateText = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color.fromRGBO(165, 165, 165, 1.0),
);

TextStyle notificationMessageText = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: Color.fromRGBO(40, 40, 40, 1.0),
);

ButtonStyle profileButtonStyle = OutlinedButton.styleFrom(
  elevation: 10,
  shadowColor: Color.fromRGBO(220, 220, 220, 0.7),
  backgroundColor: Color.fromRGBO(250, 250, 250, 0.8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);
TextStyle profileButtonTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 14,
);
ButtonStyle hiddenprofileButtonStyle = OutlinedButton.styleFrom(
  elevation: 10,
  shadowColor: Color.fromRGBO(220, 220, 220, 0.7),
  backgroundColor: Color.fromRGBO(250, 250, 250, 0.8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
);
TextStyle hiddenprofileButtonTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20,
);
