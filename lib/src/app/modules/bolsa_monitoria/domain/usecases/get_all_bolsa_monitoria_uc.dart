import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/errors/bolsa_monitoria_errors.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/infra/repositories/bolsa_monitoria_repository.dart';

abstract class GetAllBolsaMonitoriaUc {
  Future<void> call();
}

class GetAllBolsaMonitoriaImplUc implements GetAllBolsaMonitoriaUc {
  final BolsaMonitoriaRepository repository = Modular.get();

  @override
  Future<void> call() async {
    try {
      await repository.getAll();
    } on BolsaMonitoriaErrors catch (e) {
      asuka.AsukaSnackbar.alert(e.errorMessage).show();
    } on Exception catch (e) {
      asuka.AsukaSnackbar.alert(e.toString()).show();
    }
  }
}
