import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors. red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var r = Random.secure();
  int leftDiceNum = 1;
  int rightDiceNum = 1;

  void updateState() {
    setState(() {
      leftDiceNum = r.nextInt(6) + 1;
      rightDiceNum = r.nextInt(6) + 1;
      print('Random is left: $leftDiceNum & the right: $rightDiceNum');

    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            // No need to wrap with Padding since the FlatButton is wrapped
            // with padding of 16 by default. Can be checked in Flutter inspector.
              child: FlatButton(
                child: Image.asset("images/dice$leftDiceNum.png"),
                onPressed: () {
                  updateState();
                },
              )
          ),
          Expanded(
              child: FlatButton(
                child: Image.asset("images/dice$rightDiceNum.png"),
                onPressed: () {
                  updateState();
                },
              )
          ),
        ],
      ),
    );
  }
}
