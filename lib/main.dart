import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: StaggeredExample()));

class StaggeredExample extends StatefulWidget {
  const StaggeredExample({super.key});

  @override
  StaggeredExampleState createState() => StaggeredExampleState();
}

class StaggeredExampleState extends State<StaggeredExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _slideAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(0.5, 1.0, curve: Curves.easeOut),
          ),
        );

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
      appBar: AppBar(title: Text("Staggered Animation")),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: GestureDetector(
                  onTap: () {
                    _controller.reset();
                    _controller.forward();
                  },
                  child: Container(width: 200, height: 200, color: Colors.blue),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
