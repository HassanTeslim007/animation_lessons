import 'package:flutter/material.dart';

class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  List<Curve> curves = [Curves.easeIn, Curves.bounceOut, Curves.elasticInOut];

  int pressCount = 0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    super.initState();
    applyCurve(Curves.ease);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  applyCurve(Curve curve) {
    _controller.reset();
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.55, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: curve));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Challenge")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return SlideTransition(
                  position: _slideAnimation,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      width: 150,
                      height: 150,
                      color: Colors.lightGreen,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 100),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  applyCurve(curves[pressCount % curves.length]);
                  _controller.forward();
                  pressCount++;
                },
                child: const Text("Press Me!"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
