import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakuro/auth/googleSignIn.dart';
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
          'rang': user.rang,
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

  Future<List<UserClass>> getAllUsers() async {
    // Récupère une référence à la collection 'User'
    CollectionReference userCollection = firestore.collection('User');

    // Récupère tous les documents de la collection
    QuerySnapshot querySnapshot = await userCollection.get();

    // Convertit chaque document en une instance de UserClass et les ajoute à une liste
    List<UserClass> users = querySnapshot.docs.map((doc) {
      return UserClass(
        displayName: doc.get('nom'),
        email: doc.get('email'),
        uid: doc.get('uid'),
        points: doc.get('points'),
        rang: doc.get('rang'),
      );
    }).toList();

    return users;
  }

  Future<Map<String, Map<String, int>>> get5UsersNamesAndPoints() async {
    updateUserRank();
    // Récupère une référence à la collection 'User'
    CollectionReference userCollection = firestore.collection('User');

    // Récupère tous les documents de la collection
    final QuerySnapshot snapshot =
        await userCollection.orderBy('points', descending: true).limit(5).get();
    final List<DocumentSnapshot> documents = snapshot.docs;

    // Crée une map où la clé est le nom de l'utilisateur et la valeur est une autre map contenant ses points et son rang
    Map<String, Map<String, int>> usersNamesPointsAndRank = {};
    for (var doc in documents) {
      usersNamesPointsAndRank[doc.get('nom')] = {
        'points': doc.get('points'),
        'rang': doc.get('rang'),
      };
    }

    // Obtenir le current user
    if (AuthService().isConnected()) {
      final User firebaseUser = FirebaseAuth.instance.currentUser!;
      // Récupérer les points du current user
      final int currentUserPoints = await getUserPoints(firebaseUser.uid);

      QuerySnapshot querySnapshot =
          await userCollection.where('uid', isEqualTo: firebaseUser.uid).get();
      DocumentSnapshot userDoc = querySnapshot.docs.first;

      final int currentUserRank = userDoc.get('rang');

      // Ajouter le currentUser à la map seulement s'il n'y est pas déjà
      if (!usersNamesPointsAndRank.containsKey(firebaseUser.displayName)) {
        usersNamesPointsAndRank[firebaseUser.displayName!] = {
          'points': currentUserPoints,
          'rang': currentUserRank,
        };
      }
    }
    return usersNamesPointsAndRank;
  }

  Future<void> updateUserRank() async {
    try {
      CollectionReference userCollection = firestore.collection('User');

      QuerySnapshot querySnapshot =
          await userCollection.orderBy('points', descending: true).get();

      int rang = 1;

      querySnapshot.docs.forEach((doc) {
        userCollection.doc(doc.id).update({'rang': rang});
        rang++;
      });
    } catch (e) {
      print("An error occurred: $e");
    }
  }
}
