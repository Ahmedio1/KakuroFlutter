import 'package:flutter/material.dart';
import 'package:kakuro/constantes.dart';

class Btn8 extends StatelessWidget {
  const Btn8({
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
      onPressed: () {},
      child: Text('8 x 8', style: texteTaille),
    );
  }
}
