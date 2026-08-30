// Do math method

import 'package:flutter/material.dart';
import 'package:calculator/app/localization/generated/l10n.dart';



String doMath (BuildContext context, String input) {

  final expression = input.replaceAll (' ', '');

  if (expression.isEmpty) {

    return (T.of(context).error);

  }


  final parser = _ExpressionParser (expression);


  try {

    final result = parser.parse ();


    if (!parser.isAtEnd) {

      return (T.of(context).error);

    }

    if (result == result.truncateToDouble ()) {

      return (result.toInt().toString());

    }


    return (result.toString ());

  } on FormatException {

    return (T.of(context).error);

  }

}



class _ExpressionParser {

  final String _src;


  int _pos = 0;

  _ExpressionParser (this._src);

  bool get isAtEnd => _pos >= _src.length;


  double parse () {

    final value = _parseExpression ();
    return (value);

  }


  double _parseExpression () {

    var value = _parseTerm ();


    while (!isAtEnd) {

      final ch = _peek ();

      if (ch == '+') {

        _pos++;

        value += _parseTerm ();

      } else if (ch == '-') {

        _pos++;

        value -= _parseTerm ();

      } else {

        break;

      }

    }


    return (value);

  }


  double _parseTerm () {

    var value = _parseFactor ();


    while (!isAtEnd) {

      final ch = _peek ();

      if (ch == '*') {

        _pos++;

        value *= _parseFactor ();

      } else if (ch == '/') {

        _pos++;

        final divisor = _parseFactor ();

        if (divisor == 0) {

          throw const FormatException ('Division by zero');

        }

        value /= divisor;

      } else {

        break;

      }

    }


    return (value);

  }


  double _parseFactor () {

    if (isAtEnd) {

      throw const FormatException ('Unexpected end');

    }

    final ch = _peek ();

    if (ch == '(') {

      _pos++;

      final value = _parseExpression ();

      if (_peek() != ')') {

        throw const FormatException ('Missing closing parenthesis');

      }

      _pos++;


      return (value);

    }

    if (ch == '+' || ch == '-') {

      _pos++;

      final value = _parseFactor ();


      return (ch == '-' ? -value : value);

    }


    return (_parseNumber ());

  }


  double _parseNumber () {

    final start = _pos;

    while (!isAtEnd && _peek().contains(RegExp(r'[0-9]'))) {

      _pos++;

    }

    if (!isAtEnd && _peek () == '.') {

      _pos++;

      while (!isAtEnd && _peek().contains(RegExp(r'[0-9]'))) {

        _pos++;

      }

    }

    if (_pos == start) {

      throw const FormatException ('Invalid number');

    }

    final numberStr = _src.substring (start, _pos);
    final value = double.tryParse (numberStr);

    if (value == null || value.isNaN) {

      throw const FormatException ('Invalid number');

    }


    return (value);

  }


  String _peek () {

    return (_src[_pos]);

  }

}