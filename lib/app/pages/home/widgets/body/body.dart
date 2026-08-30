// Home page - Body

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'widgets/expression/expression.dart';
import 'widgets/inputer/inputer.dart';



class BodyComponent extends HookWidget {

  const BodyComponent ({super.key});


  @override Widget build (BuildContext context) {

    final ValueNotifier <String> expression = useState ('');
    final ValueNotifier <bool> justResoulted = useState (false);


    return (

      Column (
        children: [
          Expanded (
            child: Container ()
          ),
          Expression (
            text: expression,
            justResoulted: justResoulted
          ),
          Expanded (
            child: Inputer (
              expression: expression,
              justResoulted: justResoulted
            )
          )
        ]
      )

    );

  }

}