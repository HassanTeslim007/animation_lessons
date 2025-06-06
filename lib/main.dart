import 'package:animations_lesson/challenge.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ImplicitAnimationExample()));

// Implicit Animation
//Definition: Implicit animations are animations that automatically animate changes to properties of a widget without requiring explicit animation controllers or tweens. They are simpler to implement and are useful for straightforward transitions.

// Example: AnimatedContainer, AnimatedOpacity, AnimatedPadding, etc.

//Code Example:
// This example demonstrates an AnimatedContainer that changes its size and color when tapped.

class ImplicitAnimationExample extends StatefulWidget {
  const ImplicitAnimationExample({super.key});

  @override
  ImplicitAnimationExampleState createState() =>
      ImplicitAnimationExampleState();
}

class ImplicitAnimationExampleState extends State<ImplicitAnimationExample> {
  bool _toggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Implicit Animation"),
        actions: [
          IconButton(
            icon: Icon(Icons.question_mark),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Challenge()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() => _toggled = !_toggled);
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            width: _toggled ? 200 : 100,
            height: _toggled ? 200 : 100,
            color: _toggled ? Colors.blue : Colors.red,
            child: Center(
              child: Text(
                //Text jumps in size when toggled but not smoothly as it is not animated
                'Tap Me!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: _toggled ? 24 : 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
