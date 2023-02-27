import 'package:asuka/asuka.dart' as asuka;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../errors/login_errors.dart';
import '../infra/repositories/login_repository.dart';

import '../entities/login.dart';

abstract class LogarUsuarioUc {
  Future<UserCredential> call(Login login);
}

class LogarUsuarioImplUc implements LogarUsuarioUc {
  final LoginRepository repository = Modular.get();

  @override
  Future<UserCredential> call(Login login) async {
    try {
      var userCredential = await repository.login(login);
      if (userCredential.user != null) {
        Modular.to.pushNamed('/home', arguments: userCredential);
      }
      return userCredential;
    } on LoginErrors catch (e) {
      asuka.AsukaSnackbar.alert(e.errorMessange);
      rethrow;
    } on Exception catch (_) {
      asuka.AsukaSnackbar.alert('Erro ao fazer Login');
      rethrow;
    }
  }
}
