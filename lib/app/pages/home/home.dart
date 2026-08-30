// Home page

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'widgets/appbar/appbar.dart';
import 'widgets/body/body.dart';



class Home extends HookWidget {

  const Home ({super.key});


  @override Widget build (BuildContext context) {

    return (

      Scaffold (
        appBar: AppBarComponent (),
        body: BodyComponent ()
      )

    );

  }

}