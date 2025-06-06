import 'package:animations_lesson/challenge.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: TweenExample()));

// A Tween (short for "in-between") defines how to interpolate between two values (e.g., size, position, color). You animate the Tween, not the value directly. Used with AnimationController or CurvedAnimation.

// This example demonstrates how to use a Tween to animate a widget's position and size.

class TweenExample extends StatefulWidget {
  const TweenExample({super.key});

  @override
  TweenExampleState createState() => TweenExampleState();
}

class TweenExampleState extends State<TweenExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _positionAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(1.5, 1.5),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _sizeAnimation = Tween<double>(begin: 50, end: 150).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween Animation"),
        actions: [
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
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Transform.translate(
              offset: _positionAnimation.value * 100,
              child: Container(
                width: _sizeAnimation.value,
                height: _sizeAnimation.value,
                color: Colors.orange,
              ),
            );
          },
        ),
      ),
    );
  }
}
