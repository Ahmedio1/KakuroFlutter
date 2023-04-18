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
        title: timer,
      ),
    );
  }
}
