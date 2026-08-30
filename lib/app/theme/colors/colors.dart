// Colors library

import 'package:flutter/material.dart';



enum AppThemeOption {

  dark,
  light

}



class AppColors extends ThemeExtension <AppColors> {

  final Color buttonText;
  final Color buttonBack;
  final Color inputerBack;
  final Color expressionBack;
  final Color blockBorder;


  const AppColors ({
    required this.buttonText,
    required this.buttonBack,
    required this.inputerBack,
    required this.expressionBack,
    required this.blockBorder
  });


  static const AppColors dark = AppColors (
    buttonText: Color (0xfff2f2f2),
    buttonBack: Color.fromARGB(255, 43, 43, 43),
    inputerBack: Color.fromARGB (32, 64, 64, 64),
    expressionBack: Color.fromARGB (32, 32, 32, 32),
    blockBorder: Color (0xff202020)
  );

  static const AppColors light = AppColors (
    buttonText: Color (0xff000000),
    buttonBack: Color.fromARGB(255, 230, 230, 230),
    inputerBack: Color.fromARGB (32, 64, 64, 64),
    expressionBack: Color.fromARGB (32, 32, 32, 32),
    blockBorder: Color.fromARGB(255, 180, 180, 180)
  );


  @override AppColors copyWith ({
    Color? buttonText,
    Color? buttonBack,
    Color? inputerBack,
    Color? expressionBack,
    Color? blockBorder
  }) {

    return (

      AppColors (
        buttonText: buttonText ?? this.buttonText,
        buttonBack: buttonBack ?? this.buttonBack,
        inputerBack: inputerBack ?? this.inputerBack,
        expressionBack: expressionBack ?? this.expressionBack,
        blockBorder: blockBorder ?? this.blockBorder
      )

    );

  }


  @override AppColors lerp (ThemeExtension <AppColors>? other, double t) {

    if (other is! AppColors) {

      return (this);

    }

    return (

      AppColors (
        buttonText: Color.lerp (buttonText, other.buttonText, t) ?? buttonText,
        buttonBack: Color.lerp (buttonBack, other.buttonBack, t) ?? buttonBack,
        inputerBack: Color.lerp (inputerBack, other.inputerBack, t) ?? inputerBack,
        expressionBack: Color.lerp (expressionBack, other.expressionBack, t) ?? expressionBack,
        blockBorder: Color.lerp (blockBorder, other.blockBorder, t) ?? blockBorder
      )

    );

  }

}



extension AppColorsExtension on BuildContext {

  AppColors get colors {

    return (Theme.of(this).extension<AppColors>()!);

  }

}