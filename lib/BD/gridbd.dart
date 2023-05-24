import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../page de jeu/composants/case.dart';
import '../page de jeu/composants/grille.dart';

class GridBD {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addGrid(Grille grille) {
    List<Map<String, dynamic>> dataList = [];
    for (int i = 0; i < grille.cases.length; i++) {
      Map<String, dynamic> data = {
        'estBloquee': grille.cases[i].estBloquee,
        'estSelectionee': grille.cases[i].estSelectionee,
        'valeur': grille.cases[i].valeur,
        'infos': grille.cases[i].infos,
      };
      dataList.add(data);
    }

    firestore.collection('Grid').add({
      'taille': grille.taille,
      'cases': dataList,
      'estTerminee': grille.estTerminee,
    });
  }

  Future<Grille> getRandomGridByLength(int taille) async {
    CollectionReference gridCollection = firestore.collection('Grid');

    QuerySnapshot querySnapshot =
        await gridCollection.where('taille', isEqualTo: taille).get();

    List<Grille> grids = [];

    if (querySnapshot.docs.isNotEmpty) {
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        DocumentSnapshot gridDoc = querySnapshot.docs[i];

        List<Case> cases = [];
        for (int j = 0; j < gridDoc.get('cases').length; j++) {
          Case caseTemp = Case(
            gridDoc.get('cases')[j]['valeur'],
            gridDoc.get('cases')[j]['estBloquee'],
            gridDoc.get('cases')[j]['infos'].cast<int>(),
          );
          cases.add(caseTemp);
        }

        Grille grilleTemp = Grille(
          gridDoc.get('taille'),
          cases,
          gridDoc.get('estTerminee'),
        );

        grids.add(grilleTemp);
      }
    }
    var random = new Random();
    var randomNumber = random.nextInt(grids.length);
    return grids[randomNumber];
  }

  Future<void> updateCaseGrid() async {
    CollectionReference gridCollection = firestore.collection('Grid');
    QuerySnapshot querySnapshot = await gridCollection.get();
    List<Grille> grids = [];

    if (querySnapshot.docs.isNotEmpty) {
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        DocumentSnapshot gridDoc = querySnapshot.docs[i];

        List<Case> cases = [];
        for (int j = 0; j < gridDoc.get('cases').length; j++) {
          if (gridDoc.get('cases')[j]['valeur'] != 0) {
            Case caseTemp = Case(
              gridDoc.get('cases')[j]['valeur'],
              true,
              gridDoc.get('cases')[j]['infos'].cast<int>(),
            );
          } else {
            Case caseTemp = Case(
              gridDoc.get('cases')[j]['valeur'],
              gridDoc.get('cases')[j]['estBloquee'],
              gridDoc.get('cases')[j]['infos'].cast<int>(),
            );
            cases.add(caseTemp);
          }
        }

        List<Map<String, dynamic>> dataList = [];
        for (int i = 0; i < cases.length; i++) {
          Map<String, dynamic> data = {
            'estBloquee': cases[i].estBloquee,
            'estSelectionee': cases[i].estSelectionee,
            'valeur': cases[i].valeur,
            'infos': cases[i].infos,
          };
          dataList.add(data);
        }
        gridDoc.reference.update({'cases': dataList});
      }
    }
  }
}
