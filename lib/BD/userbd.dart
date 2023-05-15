import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakuro/auth/googleSignIn.dart';
import 'package:kakuro/auth/signin.dart';
import 'package:kakuro/Classe/userclass.dart';

class UserBD {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUser(UserClass user) {
    // Crée un document dans la collection 'users' avec les données de l'utilisateur
    return firestore
        .collection('User')
        .add({
          'nom': user.displayName,
          'email': user.email,
          'uid': user.uid,
          'points': user.points,
          // Ajoutez ici d'autres informations que vous voulez stocker pour chaque utilisateur
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<bool> isUserPresent(String? userId) async {
    // Récupère une référence à la collection 'User'
    CollectionReference userCollection = firestore.collection('User');

    // Crée une requête pour trouver les documents qui ont l'ID utilisateur spécifié
    QuerySnapshot querySnapshot =
        await userCollection.where('uid', isEqualTo: userId).get();

    // Vérifie si la requête a renvoyé des documents
    if (querySnapshot.docs.isNotEmpty) {
      // Il y a au moins un document avec l'ID utilisateur spécifié, donc l'utilisateur est présent dans la base de données
      print("User is present in the database");
      return true;
    } else {
      // Il n'y a pas de document avec l'ID utilisateur spécifié, donc l'utilisateur n'est pas présent dans la base de données
      print("User is not present in the database");
      return false;
    }
  }

  Future<int> getUserPoints(String? userId) async {
    // Récupère une référence à la collection 'User'
    CollectionReference userCollection = firestore.collection('User');

    // Crée une requête pour trouver les documents qui ont l'ID utilisateur spécifié
    QuerySnapshot querySnapshot =
        await userCollection.where('uid', isEqualTo: userId).get();

    // Vérifie si la requête a renvoyé des documents
    if (querySnapshot.docs.isNotEmpty) {
      // Il y a au moins un document avec l'ID utilisateur spécifié, donc l'utilisateur est présent dans la base de données

      // Récupère le premier document renvoyé par la requête
      DocumentSnapshot userDoc = querySnapshot.docs.first;

      // Récupère l'attribut 'points' du document
      int points = userDoc.get('points');
      return points;
    } else {
      // Il n'y a pas de document avec l'ID utilisateur spécifié, donc l'utilisateur n'est pas présent dans la base de données
      return 0;
    }
  }
}
