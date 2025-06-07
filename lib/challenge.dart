import 'dart:math';

import 'package:flutter/material.dart';

class StaggeredChallenge extends StatefulWidget {
  const StaggeredChallenge({super.key});

  @override
  State<StaggeredChallenge> createState() => _StaggeredChallengeState();
}

class _StaggeredChallengeState extends State<StaggeredChallenge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scaleAnimation;
  late Animation<double> rotateAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
    rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.5, 1.0)));
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Challenge')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) => ScaleTransition(
            scale: scaleAnimation,
            child: Transform.rotate(
              angle: rotateAnimation.value * pi * 2,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  border: Border(left: BorderSide(width: 3)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
