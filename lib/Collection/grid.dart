import 'package:cloud_firestore/cloud_firestore.dart';

class Grid {
  final int lenght;
  

  Grid({required this.lenght});

  Map<String, dynamic> toMap() {
    return {'length': lenght};
  }
}

class FirestoreService {
  final CollectionReference _gridRef =
      FirebaseFirestore.instance.collection('grid');

  Future<void> addGrid(Grid grid) async {
    await _gridRef.add(grid.toMap());
  }
}
