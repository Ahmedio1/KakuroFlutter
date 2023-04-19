import 'package:flutter/material.dart';
import 'package:kakuro/constants.dart';

class Btn4 extends StatelessWidget {
  const Btn4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(16.0),
        textStyle: const TextStyle(fontSize: 20, fontFamily: 'Inter'),
      ),
      onPressed: () => Navigator.pop(context, 'Cancel'),
      child: const Text('4X4',
          style: TextStyle(color: kBlueColor, fontFamily: 'Inter')),
    );
  }
}
