import 'package:flutter/material.dart';
import 'package:kakuro/auth/googleSignIn.dart';

import '../../constantes.dart';
import 'pop_up_profil/btn_points.dart';
import 'pop_up_profil/btn_pseudo.dart';

class BtnProfil extends StatelessWidget {
  const BtnProfil({super.key});

  @override
  Widget build(BuildContext context) {
    bool isConnected = false;
    return Container(
      alignment: Alignment.center,
      width: 120,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: () {
          isConnected = AuthService().isConnected();
          if (!isConnected) {
            AuthService().signInWithGoogle();
          } else {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                title: Text(
                  'Votre profil',
                  style: bullesTexte(context),
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: NetworkImage(
                              AuthService().getUser().photoURL.toString()),
                          height: 100,
                          width: 100),
                      SizedBox(height: 20),
                      BtnPseudo(),
                      SizedBox(height: 15),
                      BtnPoints(),
                      SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          //alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          backgroundColor: Theme.of(context)
              .colorScheme
              .primary, // Couleur du fond du bouton (bleu)
        ),
        child: Icon(Icons.account_circle,
            size: 70, color: Theme.of(context).colorScheme.background),
      ),
    );
  }
}
