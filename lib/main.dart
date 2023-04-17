import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  //when our app needs to change content oftenly Stateful

  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  //const DicePage({super.key});

  int leftDiceNumber = 1; //declaring variables in the name of Dice numbers
  int rightDiceNumber = 1; //starting page will show dice 1 on both the dices
  
  void changeDiceFace() {//we created a new func && juz called in LN 57 & LN 68
    setState(() {
      /*setState is used to avoid for calling the build;
                    so no need to use hot restart - hot reload again*/
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      /*that 6 indicates the range of 0-5 ;
                    in order to get the range of 1 - 6 we've juz added no.1 to it*/
      //To use Random() class we've imported dart:math library
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            //is used to keep more than one images in a row without the conflicts arrsing
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    changeDiceFace();
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png')),
            ),
          ),
        ],
      ),
    );
  }
}
