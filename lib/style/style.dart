import 'package:flutter/material.dart';

// Text
TextStyle textStyleDefault =
    TextStyle(fontFamily: 'Montserrat', fontSize: 18.0, color: colorOnWhiteBackground);

TextStyle textStyleQuotation = textStyleDefault.copyWith(
  fontFamily: 'Times New Roman',
  fontStyle: FontStyle.italic,
);

TextStyle textStyleHeading = textStyleDefault.copyWith(
  fontWeight: FontWeight.bold,
  fontSize: 26.0,
);

TextStyle textStyleHeadingPrimary = textStyleHeading.copyWith(
  color: colorPrimary,
);
TextStyle textStyleHeadingDark = textStyleHeading.copyWith(
  color: colorOnDarkBackground,
);


TextStyle textStyleTitle = textStyleDefault.copyWith(
  fontWeight: FontWeight.bold,
  fontSize: 22.0,
);
TextStyle textStyleTitlePrimary = textStyleDefault.copyWith(
  fontWeight: FontWeight.bold,
  fontSize: 22.0,
  color: colorTextDefault,
);
TextStyle textStyleTitleDarkBackground = textStyleDefault.copyWith(
  fontWeight: FontWeight.bold,
  fontSize: 22.0,
  color: colorOnDarkBackground,
);
TextStyle textStyleSubtitle = textStyleDefault.copyWith(
  fontSize: 20.0,
);
TextStyle textStyleSubtitleBold = textStyleSubtitle.copyWith(
  fontWeight: FontWeight.bold,
);

TextStyle textStyleErrorMessage = TextStyle(color: colorError);

TextStyle textStyleButtonPrimary = TextStyle(
  fontSize: 15,
  color: colorTextDefault,
);

TextStyle textStyleDefaultPrimary = textStyleDefault.copyWith(
  color: colorTextDefault,
);

TextStyle textStyleDarkBackground = textStyleDefault.copyWith(
  color: colorOnDarkBackground,
);

// Color
Color colorTextDefault = Colors.black;
Color colorPrimary = Color(0xFFE02E2E);
Color colorBackground = Colors.white;
Color colorBackgroundDark = Colors.black;
Color colorInactive = Colors.grey;
Color colorError = Colors.red;
Color colorTextPrimary = Colors.white;
Color colorOnWhiteBackground = Colors.black;
Color colorOnDarkBackground = Colors.white;
Color colorAppBar = Colors.white;
//decoration

BoxDecoration decorationRoundContainer = BoxDecoration(
  color: Colors.green,
  borderRadius: new BorderRadius.only(
  topLeft: Radius.circular(20),
  topRight: Radius.circular(20),
  )
);

BoxDecoration boxDecorationDefault = BoxDecoration(
  color: colorBackground,
  
  border: Border.all(width: 0.5),
);

// Textbox Width
const double textboxWidthMedium = 220.0;
const double textboxWidthLarge = 280.0;
