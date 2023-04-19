import 'package:flutter/material.dart';

import '../../../constants.dart';

class Btn6 extends StatelessWidget {
  const Btn6({
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
      onPressed: () {},
      child: const Text('6X6',
          style: TextStyle(color: kBlueColor, fontFamily: 'Inter')),
    );
  }
}
