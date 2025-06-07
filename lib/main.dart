import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: HeroFirstPage()));

//Hero animations automatically animate a widget from one screen to another when it's shared between routes using a Hero widget with the same tag.


class HeroFirstPage extends StatelessWidget {
  const HeroFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero Animation - Page 1")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HeroSecondPage()),
            );
          },
          child: Hero(
            tag: 'heroBox',
            child: Container(width: 100, height: 100, color: Colors.purple),
          ),
        ),
      ),
    );
  }
}

class HeroSecondPage extends StatelessWidget {
  const HeroSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero Animation - Page 2")),
      body: Center(
        child: Hero(
          tag: 'heroBox',
          child: Container(width: 300, height: 300, color: Colors.red),
        ),
      ),
    );
  }
}
