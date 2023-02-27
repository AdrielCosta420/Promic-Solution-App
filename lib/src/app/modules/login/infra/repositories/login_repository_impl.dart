import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/login/domain/entities/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:promic_app/src/app/modules/login/domain/errors/login_errors.dart';
import 'package:promic_app/src/app/modules/login/domain/infra/repositories/login_repository.dart';
import 'package:promic_app/src/app/modules/login/infra/datasources/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource = Modular.get();

  @override
  Future<UserCredential> login(Login login) async {
    try {
      return await datasource.login(login);
    } on LoginErrors catch (_) {
      throw 'Erro ao fazer Login';
    } on Exception catch (_) {
      throw 'Erro desconhecido ao fazer Login';
    }
  }
}