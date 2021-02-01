import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DBStorage {
  var error;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  setCollection(String name) {
    CollectionReference collection =
        FirebaseFirestore.instance.collection(name);
    return collection;
  }

  Future<String> newUserCollection(
      String _email,
      String _password,
      String _firstName,
      String _lastName,
      String _gender,
      String _birthday,
      String uid) {
    CollectionReference users = setCollection('users');
    users
        .doc(uid)
        .set({
          'firstName': _firstName,
          'lastName': _lastName,
          'gender': _gender,
          'birthday': _birthday,
          'role': 'user',
          'email': _email,
          'password': _password,
          'uid': uid,
        })
        .then((value) => error = 'User Added')
        .catchError((catchE) => error = 'Failed to add user: $catchE');

    return error;
  }
}
