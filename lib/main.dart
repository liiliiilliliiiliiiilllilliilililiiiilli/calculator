// Root file (development entry point)

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';



void main () {

  WidgetsFlutterBinding.ensureInitialized ();

  SystemChrome.setPreferredOrientations ([

    DeviceOrientation.portraitUp

  ]).then ((_) {

    runApp (

      ProviderScope (

        child: App ()

      )

    );

  });

}