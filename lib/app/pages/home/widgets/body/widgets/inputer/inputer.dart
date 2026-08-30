// Home page - Body - Inputer

import 'package:flutter/material.dart';
import 'package:calculator/app/theme/colors/colors.dart';
import 'package:calculator/app/methods/domath/domath.dart';



class Inputer extends StatelessWidget {

  final ValueNotifier <String> expression;
  final ValueNotifier <bool> justResoulted;


  const Inputer ({
    super.key,
    required this.expression,
    required this.justResoulted,
  });


  @override Widget build (BuildContext context) {

    final List <String> symbols = [
      '1', '2', '3', '/',
      '4', '5', '6', '*',
      '7', '8', '9', '-',
      '.',  '0', '=', '+'
    ];


    void onTapKeyboardButton (String symbol) {

      switch (symbol) {

        case '=':

          if (justResoulted.value) {

            expression.value = '';

            justResoulted.value = false;

          }

          final result = doMath (context, expression.value);

          expression.value = result;
          justResoulted.value = true;

          break;

        default:

          if (justResoulted.value) {

            if (symbol != '+' && symbol != '-' && symbol != '*' && symbol != '/') expression.value = '';

            justResoulted.value = false;

          }

          expression.value = expression.value.length > 16
            ? expression.value
            : expression.value + symbol;

          break;

      }

    }


    return (

      Container (
        decoration: BoxDecoration (
          color: context.colors.inputerBack,
          border: Border (
            top: BorderSide (
              width: 2,
              color: context.colors.blockBorder
            )
          )
        ),
        child: GridView.count (
          padding: EdgeInsets.only (
            bottom: 16,
            top: 16
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics (),
          crossAxisCount: 4,
          childAspectRatio: 1.5,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: symbols.map ((symbol) => symbol.isEmpty
            ? const SizedBox.shrink ()
            : ElevatedButton (
              onPressed: () => onTapKeyboardButton (symbol),
              style: ElevatedButton.styleFrom (
                shape: const CircleBorder (),
                backgroundColor: context.colors.buttonBack
              ),
              child: Text (
                symbol,
                style: TextStyle (
                  fontFamily: 'Fredoka',
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: context.colors.buttonText
                )
              )
            )
          ).toList ()
        )
      )

    );

  }

}