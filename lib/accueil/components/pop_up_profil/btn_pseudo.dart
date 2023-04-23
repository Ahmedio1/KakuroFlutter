import 'package:flutter/material.dart';

import '../../../constantes.dart';

class BtnPseudo extends StatelessWidget {
  const BtnPseudo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Pseudo : ', style: bullesSecondaireTexte(context)),
        Container(
          width: 200,
          decoration: BoxDecoration(
            color: themeSombre.colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '',
            style: bullesSecondaireTexte(context),
          ),
        ),
      ],
    );
  }
}
