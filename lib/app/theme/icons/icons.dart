// Icons library

import 'package:flutter/material.dart';



class AppAssets extends ThemeExtension <AppAssets> {

  final String moon;
  final String sun;


  const AppAssets ({
    required this.moon,
    required this.sun
  });


  static const AppAssets dark = AppAssets (
    moon: 'assets/images/icons/common/moon.svg',
    sun: 'assets/images/icons/common/sun.svg'
  );

  static const AppAssets light = AppAssets (
    moon: 'assets/images/icons/common/moon.svg',
    sun: 'assets/images/icons/common/sun.svg'
  );


  @override AppAssets copyWith ({
    String? moon,
    String? sun
  }) {

    return (

      AppAssets (
        moon: moon ?? this.moon,
        sun: sun ?? this.sun
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