import 'package:animations_lesson/challenge.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: CurvedAnimationExample()));

class CurvedAnimationExample extends StatefulWidget {
  const CurvedAnimationExample({super.key});

  @override
  CurvedAnimationExampleState createState() => CurvedAnimationExampleState();
}

class CurvedAnimationExampleState extends State<CurvedAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward();

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
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
        title: Text("Curved Animation"),
        actions: [
          IconButton(
            icon: const Icon(Icons.question_mark),
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
        child: SlideTransition(
          position: _slideAnimation,
          child: Container(width: 150, height: 150, color: Colors.indigo),
        ),
      ),
    );
  }
}
