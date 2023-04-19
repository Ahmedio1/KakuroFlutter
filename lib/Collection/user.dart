import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String email;
  final String password;

  User({required this.name, required this.email,required this.password});

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'password' : password};
  }
}

class FirestoreService {
  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(User user) async {
    await _usersRef.add(user.toMap());
  }
}
