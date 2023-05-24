import 'package:flutter/material.dart';
import 'package:kakuro/BD/userbd.dart';

import '../../constantes.dart';

class BtnClassement extends StatefulWidget {
  @override
  _BtnClassementState createState() => _BtnClassementState();
}

class _BtnClassementState extends State<BtnClassement> {
  UserBD userbd = UserBD();
  Map<String, Map<String, int>> scores = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadScores();
  }

  Future<void> loadScores() async {
    setState(() {
      isLoading = true;
    });

    scores = await userbd.get5UsersNamesAndPoints();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator();
    } else {
      // Trier les scores par ordre décroissant
      final sortedScores = scores.entries.toList()
        ..sort((a, b) =>
            (b.value['points'] ?? 0).compareTo(a.value['points'] ?? 0));

      return Container(
        alignment: Alignment.center,
        width: 120,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          onPressed: () {
            loadScores();
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                title: Text(
                  'Classement',
                  style: bullesTexte(context),
                  textAlign: TextAlign.center,
                ),
                content: SizedBox(
                  width: double.maxFinite,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: sortedScores.length,
                    itemBuilder: (BuildContext context, int index) {
                      final entry = sortedScores[index];
                      final joueur = entry.key;
                      final points = entry.value['points'];
                      final rank = entry.value['rang'];

                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: ListTile(
                          title: Text(
                            '$rank. $joueur - $points points',
                            style: bullesSecondaireTexte(context),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                actions: <Widget>[
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [],
                    ),
                  ),
                ],
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          child: Icon(Icons.align_vertical_bottom_sharp,
              color: Theme.of(context).colorScheme.background, size: 70),
        ),
      );
    }
  }
}
