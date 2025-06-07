import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(home: AnimatedWidgetExample()));

//AnimatedWidget is a base class that lets you create reusable and performance-efficient animated components without using setState() or AnimatedBuilder. You subclass it and pass in an Animation.

// It automatically rebuilds when the animation changes, allowing you to focus on the widget's appearance rather than the animation logic.

// Example: A spinning icon that rotates continuously using an AnimationController.

class AnimatedWidgetExample extends StatefulWidget {
  const AnimatedWidgetExample({super.key});

  @override
  AnimatedWidgetExampleState createState() => AnimatedWidgetExampleState();
}

class AnimatedWidgetExampleState extends State<AnimatedWidgetExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimatedWidget")),
      body: Center(
        child: SpinningIcon(animation: _controller),
      ),
    );
  }
}

class SpinningIcon extends AnimatedWidget {
  const SpinningIcon({super.key, required Animation<double> animation})
      : super(listenable: animation);

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: animation.value * 2 * pi,
      child: Icon(Icons.sync, size: 100, color: Colors.blue),
    );
  }
}
