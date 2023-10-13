import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class RemoteDataSource {
  static final firebaseApp = Firebase.app();
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instanceFor(
    app: firebaseApp,
    databaseURL:
    'https://assinmentluvit-default-rtdb.asia-southeast1.firebasedatabase.app/',
  );

  Future<DataSnapshot?> readData() async {
    final ref = firebaseDatabase.ref();
    DataSnapshot snapshot = await ref.child('/data').get();
    if (snapshot.exists == true) {
      return snapshot;
    } else {
      return null;
    }
  }
}
