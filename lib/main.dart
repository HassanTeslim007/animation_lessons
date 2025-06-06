import 'package:animations_lesson/challenge.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(home: ManualAnimationExample()));

// title: AnimationController + AnimatedBuilder

// description: AnimationController gives you manual control over animations—timing, repeating, reversing, etc. AnimatedBuilder efficiently rebuilds only the parts of the widget tree affected by the animation.

//Example
// A square rotates continuously back and forth, controlled by the animation controller.

class ManualAnimationExample extends StatefulWidget {
  const ManualAnimationExample({super.key});

  @override
  ManualAnimationExampleState createState() => ManualAnimationExampleState();
}

// SingleTickerProviderStateMixin is a mixin that allows a State object to act as a TickerProvider, which is required to drive an AnimationController.

class ManualAnimationExampleState extends State<ManualAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      //The vsync needs a TickerProvider, and that's exactly what SingleTickerProviderStateMixin provides.
      vsync: this,
    )..repeat(reverse: true); // Auto-plays back and forth
  }

  @override
  void dispose() {
    _controller.dispose(); // Always dispose controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimationController Example"),
        actions: [
          //challenge screen
          IconButton(
            icon: const Icon(Icons.question_mark),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Challenge()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (_controller.isAnimating) {
              _controller.stop();
            } else {
              // If the controller is not animating, we start it.
              // The reverse parameter controls whether the animation plays in reverse when it reaches the end.
              // If reverse is true, it will play back and forth; if false, it will only play forward.
              _controller.repeat(reverse: true);
            }
          },
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              // The builder is called every time the animation value changes.
              // Here, we can use the animation value to transform the widget.
              // In this case, we rotate the child widget based on the animation value.
              // The child is passed in to avoid rebuilding the entire widget tree unnecessarily.
              // The value of _controller ranges from 0.0 to 1.0, so we multiply it by 2 * pi to get a full rotation.
              // Transform.rotate takes an angle in radians, so we convert the animation value to radians.
              // The child widget is the one that will be rotated.
              // This is efficient because only the parts of the widget tree that depend on the animation are rebuilt.
              return Transform.rotate(
                angle: _controller.value * 2 * pi,
                child: child,
              );
            },
            child: Container(width: 100, height: 100, color: Colors.teal),
          ),
        ),
      ),
    );
  }
}
