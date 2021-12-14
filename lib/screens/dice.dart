import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  final int numberOfDice;
  const DiceScreen({Key? key, required this.numberOfDice}) : super(key: key);

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: InkWell(
            onTap: () {
              setState(() {});
            },
            child: const Text(
              "Click Here To Roll The Dice",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: GridView.builder(
            itemCount: widget.numberOfDice,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child:
                        Image.asset("assets/images/dice${rolltheDice()}.png"),
                  ),
                ),
                color: Colors.amber,
              );
            },
          ),
        ),
      ),
    );
  }

  int rolltheDice() {
    var rng = Random();
    return rng.nextInt(5) + 1;
  }
}
