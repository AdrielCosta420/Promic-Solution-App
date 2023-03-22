import 'package:promic_app/src/app/modules/login/domain/entities/login.dart';
import 'package:promic_app/src/app/modules/login/domain/errors/login_errors.dart';
import 'package:promic_app/src/app/modules/login/domain/infra/repositories/login_repository.dart';
import 'package:promic_app/src/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl({required this.datasource});

  @override
  Future<AuthResponse> login(Login login) async {
    try {
      return await datasource.login(login);
    } on LoginErrors catch (_) {
      throw 'Erro ao fazer Login';
    } on Exception catch (_) {
      throw 'Erro desconhecido ao fazer Login';
    }
  }

  @override
  Future<void> loggoff() async {
    try {
      await datasource.loggoff();
    } on LoginErrors catch (_) {
      throw 'Erro ao sair do aplicativo';
    } on Exception catch (_) {
      throw 'Erro desconhecido ao sair do aplicativo';
    }
  }
}
