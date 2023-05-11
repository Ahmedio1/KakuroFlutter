import 'package:flutter/material.dart';
import 'package:kakuro/constantes.dart';

class Btn6 extends StatelessWidget {
  const Btn6({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        textStyle: bullesSecondaireTexte(context),
      ),
      onPressed: () {},
      child: Text(
        '6 x 6',
        style: bullesSecondaireTexte(context),
      ),
    );
  }
}
