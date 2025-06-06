import 'package:flutter/material.dart';

class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<BorderRadius?> radiusAnimation;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    radiusAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(0),
      end: BorderRadius.circular(200),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.pink,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: colorAnimation.value,
                    borderRadius: radiusAnimation.value,
                  ),
                );
              },
            ),
            const SizedBox(height: 100),
            TextButton(
              onPressed: () {
                if (_controller.value == 1.0) {
                  _controller.reverse();
                } else {
                  _controller.forward(from: 0);
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Press Me'),
            ),
          ],
        ),
      ),
    );
  }
}
