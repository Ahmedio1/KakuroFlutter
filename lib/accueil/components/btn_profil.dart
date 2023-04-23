import 'package:flutter/material.dart';

import '../../constantes.dart';
import 'pop_up_profil/btn_points.dart';
import 'pop_up_profil/btn_pseudo.dart';

class BtnProfil extends StatelessWidget {
  const BtnProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
              'Votre profil',
              style: bullesSecondaireTexte(context),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                      image: AssetImage("assets/images/avatar.png"),
                      height: 100,
                      width: 100),
                  SizedBox(height: 20),
                  BtnPseudo(),
                  SizedBox(height: 15),
                  BtnPoints(),
                ],
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          //alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          backgroundColor: Theme.of(context)
              .colorScheme
              .primary, // Couleur du fond du bouton (bleu)
        ),
        child: Icon(Icons.account_circle,
            size: 40, color: Theme.of(context).colorScheme.background),
      ),
    );
  }
}
