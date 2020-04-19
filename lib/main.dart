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
                  setState(() {
                    leftDiceNum = r.nextInt(6);
                    if (leftDiceNum == 0) leftDiceNum++;
                    print("Button 1 is pressed");
                    print('Random is $leftDiceNum');
                  });
                },
              )
          ),
          Expanded(
              child: FlatButton(
                child: Image.asset("images/dice$rightDiceNum.png"),
                onPressed: () {
                  setState(() {
                    rightDiceNum = r.nextInt(6);
                    if (rightDiceNum == 0) rightDiceNum++;
                    print('Button 2 is pressed');
                    print('Random is $rightDiceNum');
                  });
                },
              )
          ),
        ],
      ),
    );
  }
}
