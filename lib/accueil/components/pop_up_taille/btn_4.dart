import 'package:flutter/material.dart';
import 'package:kakuro/constantes.dart';

class Btn4 extends StatelessWidget {
  const Btn4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: themeSombre.colorScheme.onPrimary,
        padding: const EdgeInsets.all(16.0),
        textStyle: boutonTaille,
      ),
      onPressed: () => Navigator.pop(context, 'Cancel'),
      child: Text('4 x 4', style: texteTaille),
    );
  }
}
