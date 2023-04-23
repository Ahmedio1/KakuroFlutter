import 'package:flutter/material.dart';

import '../../../constantes.dart';

class BtnPoints extends StatelessWidget {
  const BtnPoints({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Points : ', style: bullesSecondaireTexte(context)),
        Container(
          width: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
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
