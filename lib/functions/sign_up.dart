import 'package:aviastil/db/db_auth.dart';
import 'package:aviastil/db/db_storage.dart';

Future<String> signUp(
  String _email,
  String _password,
  String _firstName,
  String _lastName,
  String _gender,
  String _birthday,
) async {
  String _currentUser;
  await DBAuth().signUp(_email, _password);

  _currentUser = DBAuth().getUID();

  DBStorage().newUserCollection(_email, _password, _firstName, _lastName,
      _gender, _birthday, _currentUser);
  
  return _currentUser;
}
