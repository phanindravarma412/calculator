import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          centerTitle: true,
        ),
        body: Calculator(),
      ),
    ),
  );
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String touchedNumber = '';
  List calculation() {
    List<String> numbers = [];
    double result;
    if (touchedNumber.contains('+')) {
      numbers = touchedNumber.split('+');
      print(numbers);
      result = double.parse(numbers[0]) + double.parse(numbers[1]);
//      List<int> lint = numbers.map(int.parse).toList();
    } else if (touchedNumber.contains('-')) {
      numbers = touchedNumber.split('-');
      print(numbers);
      result = double.parse(numbers[0]) - double.parse(numbers[1]);
    } else if (touchedNumber.contains('x')) {
      numbers = touchedNumber.split('x');
      print(numbers);
      result = double.parse(numbers[0]) * double.parse(numbers[1]);
    } else if (touchedNumber.contains('/')) {
      numbers = touchedNumber.split('/');
      print(numbers);
      result = double.parse(numbers[0]) / double.parse(numbers[1]);
    } else {
      result = double.parse(touchedNumber);
    }
    print(result);
    setState(() {
      touchedNumber = result.toString();
    });
  }

  Widget onPressedFunction(String button) {
    print(touchedNumber);
    return FlatButton(
      padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
      onPressed: () {
        setState(() {
          touchedNumber = touchedNumber + '$button';
          print(touchedNumber);
        });
      },
      child: Text(
        '${button}',
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          child: Text(
            '${touchedNumber}',
            style: TextStyle(fontSize: 25),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            onPressedFunction('7'),
            onPressedFunction('8'),
            onPressedFunction('9'),
            onPressedFunction('+'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            onPressedFunction('4'),
            onPressedFunction('5'),
            onPressedFunction('6'),
            onPressedFunction('-'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            onPressedFunction('1'),
            onPressedFunction('2'),
            onPressedFunction('3'),
            onPressedFunction('x'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
              onPressed: () {
                setState(() {
                  touchedNumber = '';
                  print(touchedNumber);
                });
              },
              child: Text(
                'C',
                style: TextStyle(fontSize: 25),
              ),
            ),
            onPressedFunction('0'),
            FlatButton(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
              onPressed: () {
                calculation();
              },
              child: Text(
                '=',
                style: TextStyle(fontSize: 25),
              ),
            ),
            onPressedFunction('/')
          ],
        ),
      ],
    );
  }
}
