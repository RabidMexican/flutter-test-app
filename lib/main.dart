import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            primary: Colors.white,
          ),
        ),
      ),
      home: MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _number = 1;
  double _result = 1;

  TextEditingController _inputController = new TextEditingController(text: '1');

  void _add() {
    setState(() {
      _result += _number;
    });
  }

  void _subtract() {
    setState(() {
      _result -= _number;
    });
  }

  void _divide() {
    setState(() {
      _result /= _number;
    });
  }

  void _multiply() {
    setState(() {
      _result *= _number;
    });
  }

  void _updateNumber(String input) {
    if (input.length > 0) {
      _number = int.parse(input);
    } else {
      _number = 0;
    }
    print(_number);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          constraints: BoxConstraints(minWidth: 600, maxWidth: 800),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Result : $_result',
                    style: TextStyle(fontSize: 32),
                  ),
                  TextField(
                    controller: _inputController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    onChanged: _updateNumber,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(height: 10),
                        TextButton(
                          child: Text('+'),
                          onPressed: _add,
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          child: Text('-'),
                          onPressed: _subtract,
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          child: Text('/'),
                          onPressed: _divide,
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          child: Text('*'),
                          onPressed: _multiply,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
