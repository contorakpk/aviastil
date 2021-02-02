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

  Future<void> addUser(String _buyerEmail, String _from, String _where,
      String _hotel, String _buyDate, int _peoples, int _days, int _price) {
    CollectionReference tickets = setCollection('tickets');
    return tickets
        .add({
          'buyerEmail': _buyerEmail,
          'peoples': _peoples,
          'from': _from,
          'where': _where,
          'hotel': _hotel,
          'days': _days,
          'buyDate': _buyDate,
          'price': _price
        })
        .then((value) => print("Працює"))
        .catchError((error) => print("Помилка: $error"));
  }
}
