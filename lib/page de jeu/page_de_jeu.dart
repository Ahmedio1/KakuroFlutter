import 'package:flutter/material.dart';

class PageDeJeu extends StatefulWidget {
  @override
  _PageDeJeuState createState() => _PageDeJeuState();
}

class _PageDeJeuState extends State<PageDeJeu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kakuro'),
      ),
      body: const Center(
        child: Text('Page de jeu'),
      ),
    );
  }
}
