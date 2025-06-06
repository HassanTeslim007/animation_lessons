import 'package:flutter/material.dart';

//❗ Create a widget that:

//Animates opacity and padding using AnimatedOpacity and AnimatedPadding.
//When a button is pressed, it fades out and shifts downward.

class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  bool _triggered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Challenge")),
      body: Stack(
        children: [
          Center(
            child: AnimatedPadding(
              duration: Duration(seconds: 3),
              padding: EdgeInsets.only(top: _triggered ? 100 : 0),
              curve: Curves.bounceInOut,
              child: AnimatedOpacity(
                duration: Duration(seconds: 3),
                opacity: _triggered ? 0.0 : 1.0,
                curve: Curves.bounceInOut,
                child: Text(
                  'Animate Me!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: _triggered ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: _triggered ? Colors.green : Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  setState(() {
                    _triggered = !_triggered;
                  });
                },
                child: Text('Tap to Animate'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
