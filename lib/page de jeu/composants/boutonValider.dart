import 'dart:async';
import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kakuro/BD/userbd.dart';
import 'package:kakuro/accueil/body.dart';
import 'package:kakuro/page%20de%20jeu/composants/Timer.dart';
import 'package:kakuro/page%20de%20jeu/composants/appBar.dart';
import '../../auth/googleSignIn.dart';
import '../../constantes.dart';
import 'case.dart';
import 'grille.dart';

class BoutonValider extends StatefulWidget {
  final void Function(bool) updateTheme;
  final AudioPlayer player;
  final bool isNightMode;
  final double initialVolume;
  final void Function(double) updateVolume;
  final int Function() timerValueCallback;
  final Grille grille;

  const BoutonValider(this.grille,
      {super.key,
      required this.timerValueCallback,
      required this.updateTheme,
      required this.player,
      required this.isNightMode,
      required this.initialVolume,
      required this.updateVolume});

  @override
  _BoutonValiderState createState() => _BoutonValiderState(
      updateTheme: updateTheme,
      player: player,
      isNightMode: isNightMode,
      initialVolume: initialVolume,
      updateVolume: (volume) {
        updateVolume(volume);
      });
}

class _BoutonValiderState extends State<BoutonValider> {
  final void Function(bool) updateTheme;
  final AudioPlayer player;
  final bool isNightMode;
  final double initialVolume;
  final void Function(double) updateVolume;

  bool isVerif = true;
  int timerMade = 0;
  int nbPoints = 0;

  _BoutonValiderState(
      {required this.updateTheme,
      required this.player,
      required this.isNightMode,
      required this.initialVolume,
      required this.updateVolume});

  void calculerPoints(int timerValue, int difficulty, bool isVerif) {
    // TODO: Calculate points based on timer value and difficulty
    if (AuthService().isConnected()) {
      int baseScore = 2000;
      int timeMultiplier = 2;
      int difficultyMultiplier = 2;
      int score = 0;
      if (isVerif) {
        score = baseScore -
            (timerValue * timeMultiplier) +
            (difficulty * difficultyMultiplier);

        if (score < 0) {
          score = 0;
        }
      } else {
        score = score - 500;
      }
      nbPoints = score;
      timerMade = timerValue;
      final User? firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser != null) {
        UserBD().updateUserPoints(firebaseUser.uid, score);
      }
    }
  }

  String get timerText {
    Duration duration = Duration(seconds: timerMade);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void validate() {
    int timerValue = widget.timerValueCallback();

    int difficulty = (widget.grille.taille / 2).toInt();

    isVerif = verification(widget.grille);

    calculerPoints(timerValue, difficulty, isVerif);
  }

  bool notSameChiffre(Grille grille) {
    int chiffre = 0;

    for (int i = 0; i < grille.cases.length; i++) {
      if (grille.cases[i].valeur != 0) {
        chiffre = grille.cases[i].valeur;
        int ligne = i ~/ grille.taille; // Numéro de ligne de la case i

        for (int j = ligne * grille.taille;
            j < (ligne + 1) * grille.taille;
            j++) {
          if (j != i) {
            // Exclure la case i elle-même

            if (grille.cases[j].valeur == chiffre) {
              return false;
            }
          }
        }

        for (int k = i + grille.taille;
            k < grille.cases.length;
            k += grille.taille) {
          if (grille.cases[k].valeur == chiffre) {
            return false;
          }
        }
      }
    }

    return true;
  }

  bool verification(Grille grille) {
    int somme = 0;
    int resultat = 0;
    isVerif = true;

    if (!notSameChiffre(grille)) {
      isVerif = false;
      return isVerif;
    }

    for (int i = 1; i < grille.cases.length; i++) {
      resultat = 0;
      somme = 0;
      int ligne = (i ~/ grille.taille) + 1;
      if (grille.cases[i].infos[1] != 0) {
        resultat = grille.cases[i].infos[1];

        for (int j = i + grille.taille;
            j < grille.cases.length;
            j += grille.taille) {
          somme += grille.cases[j].valeur;
        }

        if (resultat != somme) {
          isVerif = false;
          return isVerif;
        }
      }

      if (grille.cases[i].infos[0] != 0) {
        resultat = grille.cases[i].infos[0];

        for (int j = (ligne - 1) * grille.taille;
            j < (ligne) * grille.taille;
            j++) {
          somme += grille.cases[j].valeur;
        }

        if (resultat != somme) {
          isVerif = false;
          return isVerif;
        }
      }
    }

    return isVerif;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.18 * largeurEcran(context)),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 0.08 * largeurEcran(context),
            vertical: 0.03 * largeurEcran(context),
          ),
        ),
        onPressed: () {
          validate();
          if (isVerif) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  title: Text(
                    'Résultats',
                    style: bullesTexte(context),
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Points gagnés: $nbPoints',
                        style: kakuroPad(context),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Temps écoulé: $timerText ',
                        style: kakuroPad(context),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Body(
                                updateTheme: updateTheme,
                                player: player,
                                isNightMode: isNightMode,
                                initialVolume: initialVolume,
                                updateVolume: (volume) {
                                  updateVolume(volume);
                                }),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.08 * largeurEcran(context),
                          vertical: 0.03 * largeurEcran(context),
                        ),
                      ),
                      child: Text(
                        'Fermer',
                        style: bullesTexte(context),
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  title: Text(
                    'Résultats',
                    style: bullesTexte(context),
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Points perdus: $nbPoints',
                        style: kakuroPad(context),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Body(
                                updateTheme: updateTheme,
                                player: player,
                                isNightMode: isNightMode,
                                initialVolume: initialVolume,
                                updateVolume: (volume) {
                                  updateVolume(volume);
                                }),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.08 * largeurEcran(context),
                          vertical: 0.03 * largeurEcran(context),
                        ),
                      ),
                      child: Text(
                        'Fermer',
                        style: bullesTexte(context),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Text('Valider', style: bullesTexte(context)),
      ),
    );
  }
}
