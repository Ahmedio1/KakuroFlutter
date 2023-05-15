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
      );
    }).toList();

    return users;
  }

  Future<Map<String, int>> get5UsersNamesAndPoints() async {
    // Récupère une référence à la collection 'User'
    CollectionReference userCollection = firestore.collection('User');

    // Récupère tous les documents de la collection
    final QuerySnapshot snapshot =
        await userCollection.orderBy('points', descending: true).limit(5).get();
    final List<DocumentSnapshot> documents = snapshot.docs;

    // Crée une map où la clé est le nom de l'utilisateur et la valeur est ses points
    Map<String, int> usersNamesAndPoints = {};
    for (var doc in documents) {
      usersNamesAndPoints[doc.get('nom')] = doc.get('points');
    }

    // Obtenir le current user
    final User firebaseUser = FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null) {
      // Récupérer les points du current user
      final int currentUserPoints = await getUserPoints(firebaseUser.uid);

      // Ajouter le currentUser à la map seulement s'il n'y est pas déjà
      if (!usersNamesAndPoints.containsKey(firebaseUser.displayName)) {
        usersNamesAndPoints[firebaseUser.displayName!] = currentUserPoints;
      }
    }

    return usersNamesAndPoints;
  }
}
