import 'package:promic_app/src/app/modules/login/domain/entities/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:promic_app/src/app/modules/login/domain/errors/login_errors.dart';
import 'package:promic_app/src/app/modules/login/infra/datasources/login_datasource.dart';

class LoginDatasourceImpl implements LoginDatasource {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<UserCredential> login(Login login) async {
    try {
      return await auth.createUserWithEmailAndPassword(
          email: login.matricula, password: login.password);
    } on FirebaseAuthException catch (e) {
      throw LoginErrors(
          errorMessange: 'Erro ao fazer Login',
          stackTrace: e.stackTrace.toString());
    } on Exception catch (_) {
      throw LoginErrors(errorMessange: 'Erro desconhecido ao fazer Login');
    }
  }

  @override
  Future<void> loggoff() async {
    try {
      await auth.signOut();
    } on LoginErrors catch (_) {
      rethrow;
    }
  }
}
