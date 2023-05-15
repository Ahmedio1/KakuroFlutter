import 'package:flutter/material.dart';
import 'package:kakuro/auth/googleSignIn.dart';

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
        Text('Pseudo : ', style: kakuroPad(context)),
        Container(
          width: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            AuthService().getUser().displayName.toString(),
            style: bullesBleuCielTexte,
          ),
        ),
      ],
    );
  }
}
