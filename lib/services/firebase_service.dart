import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getInfo() async {
  List info = [];
  await db.collection('info').get().then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      info.add(doc.data());
    });
  });
  return info;
}
