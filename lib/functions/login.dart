import 'package:aviastil/db/db_auth.dart';

Future<String> login(
  String _email,
  String _password
) async {
  String _currentUser;
  await DBAuth().login(_email, _password);

  return _currentUser = DBAuth().getUID();
}
