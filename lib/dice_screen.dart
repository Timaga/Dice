import 'dart:math';

import 'package:flutter/material.dart';

class DiceGame extends StatefulWidget {
  @override
  State<DiceGame> createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  final Map<String, int> EdgesOfDice = {
    "dice/dice1.png": 1,
    "dice/dice2.png": 2,
    "dice/dice3.png": 3,
    "dice/dice4.png": 4,
    "dice/dice5.png": 5,
    "dice/dice6.png": 6,
  };
  bool GameStart = false;
  List<Image> TwoDice = [];
  String? FirstDice;
  String? SecondDice;
  int Score = 0;
  Map<String, int> playingDices = {};
  void ChangeDices() {
    TwoDice = [];
    Random random = Random();
    playingDices = {};
    playingDices.addAll(EdgesOfDice);
    String DiceOneKey =
        EdgesOfDice.keys.elementAt(random.nextInt(EdgesOfDice.length));
    String DiceTwoKey =
        EdgesOfDice.keys.elementAt(random.nextInt(EdgesOfDice.length));

    setState(() {
      TwoDice.add(Image.asset(DiceOneKey!));
      TwoDice.add(Image.asset(DiceTwoKey!));
      Score = EdgesOfDice[DiceOneKey]! + EdgesOfDice[DiceTwoKey]!;
    });
  }

  void StartMenu() {
    if (GameStart == false) {
      ChangeDices();
      GameStart = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    StartMenu();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 50),
          Center(
            child: Text("Your Score: $Score"),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                child: GridView.builder(
                  itemCount: TwoDice.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return TwoDice[index];
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: ChangeDices,
            child: Text("Dice!"),
          ),
          SizedBox(height: 20),
        ],
      )),
    );
  }
}
