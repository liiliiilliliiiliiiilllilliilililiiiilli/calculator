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
    required this.justResoulted
  });


  @override Widget build (BuildContext context) {

    final List <String> symbols = [
      '1', '2', '3', '/',
      '4', '5', '6', '*',
      '7', '8', '9', '-',
      '.',  '0', '=', '+'
    ];


    void onTapKeyboardButton (String symbol) {

      if (symbol == '=') {

        expression.value = doMath (context, expression.value);

        justResoulted.value = true;

      }

      else {

        if (symbol == '+' || symbol == '-' || symbol == '*' || symbol == '/') {

          expression.value = expression.value.length + 1 <= 17
            ? expression.value + symbol
            : expression.value;

        }

        else {

          if (justResoulted.value) {

            expression.value = '';

          }

          expression.value = expression.value.length + 1 <= 17
            ? expression.value + symbol
            : expression.value;

        }

        justResoulted.value = false;

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
        child: LayoutBuilder (
          builder: (context, constraints) {

            const double verticalPadding = 16.0 * 2;
            const double mainAxisSpacing = 12.0;
            const double crossAxisSpacing = 12.0;
            const int rowCount = 4;
            const int columnCount = 4;
            const double targetAspectRatio = 1.0;

            final double availableHeight = constraints.maxHeight;
            final double totalVerticalSpacing = mainAxisSpacing * (rowCount - 1);
            final double heightForButtons = availableHeight - verticalPadding - totalVerticalSpacing;
            final double buttonHeight = heightForButtons / rowCount;
            final double buttonWidth = buttonHeight * targetAspectRatio;
            final double totalCrossAxisSpacing = crossAxisSpacing * (columnCount - 1);
            final double maxGridWidth = (buttonWidth * columnCount) + totalCrossAxisSpacing;
            final double finalGridWidth = constraints.maxWidth > maxGridWidth
              ? maxGridWidth
              : constraints.maxWidth;

            return (

              Center (
                child: SizedBox (
                  width: finalGridWidth,
                  height: availableHeight,
                  child: GridView.count (
                    padding: const EdgeInsets.symmetric (
                      vertical: 16
                    ),
                    physics: const NeverScrollableScrollPhysics (),
                    crossAxisCount: columnCount,
                    childAspectRatio: targetAspectRatio,
                    mainAxisSpacing: mainAxisSpacing,
                    crossAxisSpacing: crossAxisSpacing,
                    children: symbols.map ((symbol) => symbol.isEmpty ?
                      const SizedBox.shrink ()
                    :
                      ElevatedButton (
                        onPressed: () => onTapKeyboardButton (symbol),
                        style: ElevatedButton.styleFrom (
                          shape: const CircleBorder (),
                          padding: const EdgeInsets.all (8),
                          backgroundColor: context.colors.buttonBack
                        ),
                        child: Text (
                          symbol,
                          style: TextStyle (
                            fontFamily: 'Fredoka',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: context.colors.buttonText
                          )
                        )
                      )
                    ).toList ()
                  )
                )
              )
            );
          }
        )
      )

    );

  }

}