// App (root component)

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator/app/providers/locale/locale.dart';
import 'package:calculator/app/providers/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:calculator/app/localization/generated/l10n.dart';
import 'package:calculator/app/theme/icons/icons.dart';
import 'package:calculator/app/theme/colors/colors.dart';
import 'pages/home/home.dart';



class App extends ConsumerWidget {

  const App ({super.key});


  @override build (BuildContext context, WidgetRef ref) {

    final String localeState = ref.watch (localeProvider);
    final AppThemeOption themeState = ref.watch (themeProvider);


    final AppAssets customAssets;
    final AppColors customColors;
    final Brightness baseBrightness;
    final Color backgroundColor;


    switch (themeState) {

      case AppThemeOption.dark:

        customAssets = AppAssets.dark;
        customColors = AppColors.dark;
        baseBrightness = Brightness.dark;
        backgroundColor = const Color (0xff000000);

        break;

      case AppThemeOption.light:

        customAssets = AppAssets.light;
        customColors = AppColors.light;
        baseBrightness = Brightness.light;
        backgroundColor = const Color (0xfff2f2f2);

        break;

    }


    return (

      MaterialApp (
        debugShowCheckedModeBanner: false,
        title: 'Calculator',
        localizationsDelegates: const [
            T.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: T.delegate.supportedLocales,
        locale: Locale (localeState),
        theme: ThemeData (
          pageTransitionsTheme: PageTransitionsTheme (
            builders: {
              TargetPlatform.android: FadeForwardsPageTransitionsBuilder (
                backgroundColor: backgroundColor
              )
            }
          ),
          brightness: baseBrightness,
          extensions: [
            customAssets,
            customColors
          ]
        ),
        routes: {
          '/home': (context) => const Home ()
        },
        initialRoute: '/home'
      )

    );

  }

}