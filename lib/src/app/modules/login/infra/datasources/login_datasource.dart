import 'package:firebase_auth/firebase_auth.dart';
import 'package:promic_app/src/app/modules/login/domain/entities/login.dart';

abstract class LoginDatasource {
  Future<UserCredential> login(Login login);
}
