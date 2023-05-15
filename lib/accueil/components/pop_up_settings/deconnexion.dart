import 'package:flutter/material.dart';
import 'package:kakuro/auth/googleSignIn.dart';

import '../../../constantes.dart';

class Deconnexion extends StatelessWidget {
  const Deconnexion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: ElevatedButton(
            onPressed: () async {
              await AuthService().signOutWithGoogle();
              Navigator.pop(context, 'Cancel');
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
            child: Text(
              'Se déconnecter',
              style: bullesSecondaireTexte(context),
            ),
          ),
        ),
      ],
    );
  }
}
