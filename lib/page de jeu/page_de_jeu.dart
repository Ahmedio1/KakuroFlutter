import 'package:flutter/material.dart';
import 'composants/timer.dart';

class PageDeJeu extends StatefulWidget {
  @override
  _PageDeJeuState createState() => _PageDeJeuState();
}

class _PageDeJeuState extends State<PageDeJeu> {
  @override
  Widget build(BuildContext context) {
    MyTimerApp timer = MyTimerApp();
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          SizedBox(width: 100),
          timer,
          SizedBox(width: 100),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ]),
      ),
    );
  }
}
