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

class DicePage extends StatelessWidget {
  // This can be placed outside since it need not be constructed again for every load of the page.
  var r = Random.secure();

  @override
  Widget build(BuildContext context) {
    var diceNum = 1;
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              // No need to wrap with Padding since the FlatButton is wrapped
              // with padding of 16 by default. Can be checked in Flutter inspector.
              child: FlatButton(
                child: Image.asset("images/dice$diceNum.png"),
                onPressed: () {
                  diceNum = r.nextInt(6);
                  print("Button 1 is pressed");
                  print('Random is ${r.nextInt(6)}');
                },
              )
          ),
          Expanded(
              child: FlatButton(
                child: Image.asset("images/dice$diceNum.png"),
                onPressed: () {
                  print("Button 2 pressed");
                },
              )
          ),
        ],
      ),
    );
  }
}
