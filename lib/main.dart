import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  //MaterialApp is a widget that wraps no of widget we commonly use
  runApp(MaterialApp(
    //ebugShowCheckedModeBanner removes "DEBUG" from the emulator
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      //Scaffold used to place common items on to the screen
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Center(child: Text('DICE')),
        backgroundColor: Colors.blueGrey[600],
      ),
      //calling the DicePage() stateful widget
      body: DicePage(),
    ),
  ));
}
// stateless widget just gives you a idle UI with no interactivity
//where as stateful gives you beautiful UI with functionality

//stateful widget
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

//state
class _DicePageState extends State<DicePage> {
  int topDiceNumber = 5;
  int bottomDiceNumber = 1;

// below function can be used for changing the state in the onPressed Property
//can be used for having less lines of code

  // void changeDiceFace() {
  //   setState(() {
  //     topDiceNumber = Random().nextInt(6) + 1;
  //     bottomDiceNumber = Random().nextInt(6) + 1;
  //   });
  // }

  @override
  //whenever we perform HOT RELOAD build function is built again
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          //Expanded is used here to make sure images don't overflowing out of the screen.
          Expanded(
              child: FlatButton(
            onPressed: () {
              //setState updates the value by calling the build method
              //remember dirty dog example
              setState(() {
                //random renerates random no from 0 to max
                //for that reason + 1
                topDiceNumber = Random().nextInt(6) + 1;
                bottomDiceNumber = Random().nextInt(6) + 1;
                //instead of above two lines use the changeDiceFace function
              });
              //print('top button is pressed');
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('images/dice$topDiceNumber.png'),
            ),
          )),
          Expanded(
              child: FlatButton(
            onPressed: () {
              setState(() {
                bottomDiceNumber = Random().nextInt(6) + 1;
                topDiceNumber = Random().nextInt(6) + 1;
              });
              //print('bottom button is pressed');
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('images/dice$bottomDiceNumber.png'),
            ),
          ))
        ],
      ),
    );
  }
}
