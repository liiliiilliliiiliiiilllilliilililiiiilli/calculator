// Home page

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:calculator/app/pages/home/widgets/appbar/appbar.dart';
import 'package:calculator/app/pages/home/widgets/body/body.dart';



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