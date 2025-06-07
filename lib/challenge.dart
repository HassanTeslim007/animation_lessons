import 'package:flutter/material.dart';

class HeroChallengeA extends StatelessWidget {
  const HeroChallengeA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Circle Avatar Hero')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HeroChallengeB()),
            );
          },
          child: Hero(
            tag: 'challenge',
            child: CircleAvatar(backgroundColor: Colors.amber, radius: 45),
          ),
        ),
      ),
    );
  }
}

class HeroChallengeB extends StatelessWidget {
  const HeroChallengeB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Circle Avatar Hero 2')),
      body: Center(
        child: Hero(
          tag: 'challenge',
          child: CircleAvatar(backgroundColor: Colors.amber, radius: 85),
        ),
      ),
    );
  }
}
