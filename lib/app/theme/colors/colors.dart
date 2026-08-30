// Colors library

import 'package:flutter/material.dart';



enum AppThemeOption {

  dark,
  light

}



class AppColors extends ThemeExtension <AppColors> {

  final Color blockBorder;
  final Color buttonBack;
  final Color buttonText;
  final Color expressionBack;
  final Color inputerBack;


  const AppColors ({
    required this.blockBorder,
    required this.buttonBack,
    required this.buttonText,
    required this.expressionBack,
    required this.inputerBack
  });


  static const AppColors dark = AppColors (
    blockBorder: Color (0xff202020),
    buttonBack: Color (0xff2b2b2b),
    buttonText: Color (0xfff2f2f2),
    expressionBack: Color (0x20202020),
    inputerBack: Color (0x20404040)
  );

  static const AppColors light = AppColors (
    blockBorder: Color (0xffb4b4b4),
    buttonBack: Color (0xffe6e6e6),
    buttonText: Color (0xff000000),
    expressionBack: Color (0x20202020),
    inputerBack: Color (0x20404040)
  );


  @override AppColors copyWith ({
    Color? blockBorder,
    Color? buttonBack,
    Color? buttonText,
    Color? expressionBack,
    Color? inputerBack
  }) {

    return (

      AppColors (
        blockBorder: blockBorder ?? this.blockBorder,
        buttonBack: buttonBack ?? this.buttonBack,
        buttonText: buttonText ?? this.buttonText,
        expressionBack: expressionBack ?? this.expressionBack,
        inputerBack: inputerBack ?? this.inputerBack
      )

    );

  }


  @override AppColors lerp (ThemeExtension <AppColors>? other, double t) {

    if (other is! AppColors) {

      return (this);

    }

    return (

      AppColors (
        blockBorder: Color.lerp (blockBorder, other.blockBorder, t) ?? blockBorder,
        buttonBack: Color.lerp (buttonBack, other.buttonBack, t) ?? buttonBack,
        buttonText: Color.lerp (buttonText, other.buttonText, t) ?? buttonText,
        expressionBack: Color.lerp (expressionBack, other.expressionBack, t) ?? expressionBack,
        inputerBack: Color.lerp (inputerBack, other.inputerBack, t) ?? inputerBack
      )

    );

  }

}



extension AppColorsExtension on BuildContext {

  AppColors get colors {

    return (Theme.of(this).extension<AppColors>()!);

  }

}