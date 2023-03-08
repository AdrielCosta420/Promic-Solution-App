import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/login/domain/infra/repositories/login_repository.dart';

import '../errors/login_errors.dart';

abstract class LoggofUsuarioUc {
  Future<void> loggof();
}

class LoggofUsuarioImplUc implements LoggofUsuarioUc {
  final LoginRepository repository = Modular.get();

  @override
  Future<void> loggof() async {
    try {
      await repository.loggoff();
      Modular.to.pushNamed('/');
    } on LoginErrors catch (e) {
      asuka.AsukaSnackbar.alert(e.errorMessange);
    } on Exception catch (_) {
      asuka.AsukaSnackbar.alert('Erro ao sair do App');
      rethrow;
    }
  }
}
