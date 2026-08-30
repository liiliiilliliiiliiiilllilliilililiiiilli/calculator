// Icons library

import 'package:flutter/material.dart';



class AppAssets extends ThemeExtension <AppAssets> {

  final String sun;
  final String moon;


  const AppAssets ({
    required this.sun,
    required this.moon
  });


  static const AppAssets dark = AppAssets (
    sun: 'assets/images/icons/common/sun.svg',
    moon: 'assets/images/icons/common/moon.svg'
  );

  static const AppAssets light = AppAssets (
    sun: 'assets/images/icons/common/sun.svg',
    moon: 'assets/images/icons/common/moon.svg'
  );


  @override AppAssets copyWith ({
    String? sun,
    String? moon
  }) {

    return (

      AppAssets (
        sun: sun ?? this.sun,
        moon: moon ?? this.moon
      )

    );

  }


  @override AppAssets lerp (ThemeExtension <AppAssets>? other, double t) {

    if (other is! AppAssets) {

      return (this);

    }

    return (t < 0.5 ? this : other);

  }

}



extension AppAssetsExtension on BuildContext {

  AppAssets get icons {

    return (Theme.of(this).extension<AppAssets>()!);

  }

}