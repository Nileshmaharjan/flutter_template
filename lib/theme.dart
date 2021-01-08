import 'package:flutter/material.dart';
import 'package:sample/res/colors.dart';

const avenirFontFamily = 'AvenirNextLTPro';
const proximaFontFamily = 'ProximaNova';


ThemeData sampleAppTheme() =>
    ThemeData(
      // Define the default Brightness and Colors
      brightness: Brightness.light,

      primaryColor: AppColors.purple600,
      backgroundColor: AppColors.grey100,
      accentColor: AppColors.ecoGreen,

      fontFamily: avenirFontFamily,

      appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black, size: 5),
          textTheme: TextTheme(body1: TextStyle(color: Colors.black))),

      textTheme: AppTheme.textTheme,
    );

// https://github.com/mitesh77/Best-Flutter-UI-Templates/blob/master/best_flutter_ui_templates/lib/designCourse/designCourseAppTheme.dart
class AppTheme {
  AppTheme._();



  // Gradients
  static const LinearGradient purple = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 1],
      colors: [
        AppColors.purple400,
        AppColors.purple600,
      ],
      tileMode: TileMode.clamp);

  static const LinearGradient purpleAlt = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0, 1],
    colors: [
      Color(0xff691A89),
      Color(0xff4A0067),
    ],
  );

  static const LinearGradient green = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 1],
      colors: [
        Color.fromRGBO(0, 193, 78, 1),
        Color.fromRGBO(15, 168, 69, 1),
      ],
      tileMode: TileMode.clamp);

  static const TextTheme textTheme = TextTheme(
      bodyText1: font1,
      bodyText2: font2
  );

  static const TextStyle font1 = TextStyle(
    // body2 -> body1
    fontFamily: avenirFontFamily,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    color: Colors.white,
  );

  static const TextStyle font2 = TextStyle(
    // Caption -> caption
      fontFamily: proximaFontFamily,
      fontWeight: FontWeight.normal,
      fontSize: 12.0);
}
