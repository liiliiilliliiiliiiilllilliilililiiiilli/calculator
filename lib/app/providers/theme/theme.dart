// State providers - Theme

import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:calculator/app/theme/colors/colors.dart';



const AppThemeOption defaultTheme = AppThemeOption.dark;



final themeProvider = NotifierProvider <ThemeNotifier, AppThemeOption> (ThemeNotifier.new);



class ThemeNotifier extends Notifier <AppThemeOption> {

  @override AppThemeOption build () {

    initState ();


    return (defaultTheme);

  }


  static Future <AppThemeOption?> getSavedTheme () async {

    final SharedPreferences preferences = await SharedPreferences.getInstance ();

    final String? savedTheme = preferences.getString ('app_theme');


    switch (savedTheme) {

      case 'dark':

        return AppThemeOption.dark;

      case 'light':

        return AppThemeOption.light;

      default:

        return null;

    }

  }


  static Future <void> saveTheme (AppThemeOption theme) async {

    final SharedPreferences preferences = await SharedPreferences.getInstance ();


    switch (theme) {

      case AppThemeOption.dark:

        await preferences.setString ('app_theme', 'dark');

      case AppThemeOption.light:

        await preferences.setString ('app_theme', 'light');

    }

  }


  static AppThemeOption getSystemTheme () {

    final AppThemeOption  systemTheme = PlatformDispatcher.instance.platformBrightness == Brightness.dark
      ? AppThemeOption.dark
      : AppThemeOption.light;


    return systemTheme;

  }


  Future <void> initState () async {

    final AppThemeOption? savedTheme = await getSavedTheme ();


    if (savedTheme != null) {

      state = savedTheme;

    }

    else {

      final AppThemeOption systemTheme = getSystemTheme ();

      state = systemTheme;

      await saveTheme (systemTheme);

    }

  }


  Future <void> changeState (AppThemeOption theme) async {

    state = theme;

    await saveTheme (theme);

  }

}