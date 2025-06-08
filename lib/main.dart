import 'dart:math';
import 'package:animations_lesson/challenge.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ArcPainterExample()));

class ArcPainterExample extends StatefulWidget {
  const ArcPainterExample({super.key});

  @override
  ArcPainterExampleState createState() => ArcPainterExampleState();
}

class ArcPainterExampleState extends State<ArcPainterExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sweepAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _sweepAnimation = Tween<double>(begin: 0.0, end: 3 * pi / 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Arc Animation'), actions: [
        IconButton(
          icon: Icon(Icons.question_mark),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Challenge()),
            );
          }
        )
      ],),
      body: Center(
        child: AnimatedBuilder(
          animation: _sweepAnimation,
          builder: (_, __) {
            return CustomPaint(
              painter: ArcPainter(_sweepAnimation.value),
              child: SizedBox(width: 200, height: 200),
            );
          },
        ),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  final double sweepAngle;

  ArcPainter(this.sweepAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: 80);
    final startAngle = -pi / 2; // Start from top
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant ArcPainter oldDelegate) {
    return oldDelegate.sweepAngle != sweepAngle;
  }
}
