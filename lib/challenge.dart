
import 'package:flutter/material.dart';

class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
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
      appBar: AppBar(title: Text("Challenge")),
      body: Center(child: PulseBox(listenable: _controller)),
    );
  }
}

class PulseBox extends AnimatedWidget {
  const PulseBox({super.key, required super.listenable});

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1 + (animation.value * 0.5),
      child: Container(width: 100, height: 100, color: Colors.green),
    );
  }
}

