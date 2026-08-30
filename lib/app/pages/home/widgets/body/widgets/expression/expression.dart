// Home page - Body - Expression

import 'package:flutter/material.dart';
import 'package:calculator/app/theme/colors/colors.dart';



class Expression extends StatelessWidget {

  final ValueNotifier <String> text;
  final ValueNotifier <bool> justResoulted;


  const Expression ({
    super.key,
    required this.text,
    required this.justResoulted
  });


  @override Widget build (BuildContext context) {

    void calncelAction () {

      text.value = text.value = '';

    }


    void deleteAction () {

      if (justResoulted.value) {

        text.value = '';

        justResoulted.value = false;

      }

      text.value = text.value.substring (0, text.value.length - 1);

    }


    return (

      Container (
        decoration: BoxDecoration (
          color: context.colors.expressionBack,
          border: Border (
            top: BorderSide (
              width: 2,
              color: context.colors.blockBorder
            )
          )
        ),
        child: Padding (
          padding: const EdgeInsets.symmetric (
            horizontal: 14,
            vertical: 7
          ),
          child: Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton (
                onPressed: () => calncelAction (),
                style: ElevatedButton.styleFrom (
                  shape: const CircleBorder (),
                  backgroundColor: context.colors.buttonBack
                ),
                child: Text (
                  'C',
                  style: TextStyle (
                    fontFamily: 'Fredoka',
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: context.colors.buttonText
                  )
                )
              ),
              Expanded(
                child: Text (
                  text.value,
                  textAlign: TextAlign.end,
                  style: TextStyle (
                    fontFamily: 'Fredoka',
                    fontWeight: FontWeight.w500,
                    fontSize: 23,
                    color: context.colors.buttonText
                  )
                )
              ),
              ElevatedButton (
                onPressed: () => deleteAction (),
                style: ElevatedButton.styleFrom (
                  shape: const CircleBorder (),
                  backgroundColor: context.colors.buttonBack
                ),
                child: Text (
                  '⌫',
                  style: TextStyle (
                    fontFamily: 'Fredoka',
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: context.colors.buttonText
                  )
                )
              )
            ]
          )
        )
      )

    );

  }

}