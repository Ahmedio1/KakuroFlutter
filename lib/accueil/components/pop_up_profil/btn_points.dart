import 'package:flutter/material.dart';
import '../../../auth/googleSignIn.dart';
import '../../../constantes.dart';
import '../../../BD/userbd.dart';

class BtnPoints extends StatelessWidget {
  BtnPoints({
    super.key,
  });

  final UserBD userBD = UserBD();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Points : ', style: kakuroPad(context)),
        Container(
          width: 180,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: FutureBuilder<int>(
            future: userBD.getUserPoints(AuthService().getUser().uid),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Retourne un widget de chargement pendant que la requête est en cours
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // Affiche une erreur si quelque chose se passe mal
                return Text('Error: ${snapshot.error}');
              } else {
                // Affiche les points une fois la requête terminée
                return Text(
                  snapshot.data.toString(),
                  style: bullesBleuCielTexte,
                  textAlign: TextAlign.center,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
