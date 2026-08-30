// Locale provider

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:calculator/app/localization/generated/l10n.dart';



const String defaultState = 'en';



final localeProvider = NotifierProvider <LocaleNotifier, String> (LocaleNotifier.new);



class LocaleNotifier extends Notifier <String> {

  @override String build () {

    initiate ();


    return (defaultState);

  }


  static String getSystemLocale () {

    final Locale? systemLocale = WidgetsBinding.instance.platformDispatcher.locales.firstOrNull;


    if (systemLocale != null) {

      final bool isSupported = T.delegate.supportedLocales.any ((locale) => locale.languageCode == systemLocale.languageCode);

      if (isSupported) {

        return (systemLocale.languageCode);

      }

    }


    return ('en');

  }


  Future <void> initiate () async {

    final SharedPreferences preferences = await SharedPreferences.getInstance ();

    final String? appLocale = preferences.getString ('app_locale');


    if (appLocale == null) {

      final String systemLocale = getSystemLocale ();

      await T.load (Locale (systemLocale));

      state = systemLocale;

      await preferences.setString ('app_locale', systemLocale);

    } else {

      await T.load (Locale (appLocale));

      state = appLocale;

    }

  }


  Future <void> changeLocale (String locale) async {

    await T.load (Locale (locale));

    state = locale;

    final SharedPreferences preferences = await SharedPreferences.getInstance ();

    await preferences.setString ('app_locale', locale);

  }

}