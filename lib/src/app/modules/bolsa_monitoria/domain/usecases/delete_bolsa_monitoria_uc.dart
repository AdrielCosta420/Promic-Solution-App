import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/errors/bolsa_monitoria_errors.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/infra/repositories/bolsa_monitoria_repository.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/dto/bolsa_monitoria_dto.dart';

abstract class DeleteBolsaMonitoriaUc {
  Future<void> call(BolsaMonitoriaDto bolsaMonitoriaDto);
}

class DeleteBolsaMonitoriaImplUc implements DeleteBolsaMonitoriaUc {
  final BolsaMonitoriaRepository repository = Modular.get();
  @override
  Future<void> call(BolsaMonitoriaDto bolsaMonitoriaDto) async {
    try {
      var deletar = await repository.delete(bolsaMonitoriaDto);
      asuka.AsukaSnackbar.success('Bolsa deletada com sucesso').show();
      return deletar;
    } on BolsaMonitoriaErrors catch (_) {
      asuka.AsukaSnackbar.alert('Erro ao deletar Bolsa').show();
    } on Exception catch (e) {
      asuka.AsukaSnackbar.alert(e.toString()).show();
    }
  }
}
