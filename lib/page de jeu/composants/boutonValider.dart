import 'package:flutter/material.dart';
import '../../constantes.dart';

class BoutonValider extends StatefulWidget {
  const BoutonValider({super.key});

  @override
  _BoutonValiderState createState() => _BoutonValiderState();
}

class _BoutonValiderState extends State<BoutonValider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.18 * largeurEcran(context)),
      child: TextButton(
          style: TextButton.styleFrom(
              //elevation: 10,
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.symmetric(
                  horizontal: 0.08 * largeurEcran(context),
                  vertical: 0.03 * largeurEcran(context))),
          onPressed: () {
            print("Valider");
          },
          child: Text('Valider', style: bullesTexte(context))),
    );
  }
}
