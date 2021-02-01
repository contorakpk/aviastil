import 'package:aviastil/db/db_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class DBAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool authSignedIn;
  String uid;
  String userEmail;

  final FirebaseAuth auth = FirebaseAuth.instance;

  User user = FirebaseAuth.instance.currentUser;

  String error;

  returnInfo(String info) {
    return info;
  }

  Future<String> signUp(String _email, String _password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);

      //String currentUser = getCurrentUser();

      //DBStorage().newUserCollection(_email, _password, currentUser);
    } on FirebaseAuthException catch (e) {
      return error = e.code;
    }

    return error;
  }

  Future<String> login(String _email, String _password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      return error = e.code;
    }

    return error;
  }

  getUID() {
    return auth.currentUser.uid.toString();
  }

  sendEmailVerification() async {
    if (!user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
