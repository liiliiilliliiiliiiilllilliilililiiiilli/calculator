// Home page - AppBar

import 'package:calculator/app/providers/theme/theme.dart';
import 'package:calculator/app/theme/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:calculator/app/theme/colors/colors.dart';
import 'package:calculator/app/localization/generated/l10n.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';



class AppBarComponent extends HookConsumerWidget implements PreferredSizeWidget {

  const AppBarComponent ({super.key,});


  @override Size get preferredSize => const Size.fromHeight (kToolbarHeight + 10);


  @override Widget build (BuildContext context, WidgetRef ref) {

    final AppThemeOption themeState = ref.watch (themeProvider);
    final ThemeNotifier themeNotifier = ref.watch (themeProvider.notifier);


    final String picture = themeState == AppThemeOption.dark
      ? context.icons.sun
      : context.icons.moon;


    void switchTheme () {

      themeNotifier.changeState (themeState == AppThemeOption.dark ? AppThemeOption.light : AppThemeOption.dark);

    }


    return (

      AppBar (
        title: Padding (
          padding: const EdgeInsets.all (10),
          child: Text (
            T.of(context).title,
            style: TextStyle (
              fontFamily: 'Fredoka',
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: context.colors.buttonText
            )
          )
        ),
        actions: [
          Padding (
            padding: const EdgeInsets.only (
              top: 8
            ),
            child: ElevatedButton (
              onPressed: switchTheme,
              style: ElevatedButton.styleFrom (
                shape: const CircleBorder (),
                backgroundColor: context.colors.buttonBack
              ),
              child: SvgPicture.asset (
                picture,
                width: 19,
                height: 19
              )
            )
          )
        ]
      )

    );

  }

}