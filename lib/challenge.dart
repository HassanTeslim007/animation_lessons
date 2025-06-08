import 'dart:math';

import 'package:flutter/material.dart';

class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _angleAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: false);

    _angleAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    super.initState();
    _controller.repeat(reverse: false);
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
          builder: (context, child) =>
              CustomPaint(painter: RotatingArc(_angleAnimation.value)),
        ),
      ),
    );
  }
}

class RotatingArc extends CustomPainter {
  final double startAngle;
  RotatingArc(this.startAngle);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: 100);

    canvas.drawArc(rect, startAngle, pi, false, paint);
  }

  @override
  bool shouldRepaint(covariant RotatingArc oldDelegate) {
    return oldDelegate.startAngle != startAngle;
  }
}
