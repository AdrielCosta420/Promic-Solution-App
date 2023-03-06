//import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/infra/repositories/bolsa_monitoria_repository.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/dto/bolsa_monitoria_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:asuka/asuka.dart' as asuka;
import '../errors/bolsa_monitoria_errors.dart';

abstract class UpdateBolsaMonitoriaUc {
  Future<void> call(BolsaMonitoriaDto bolsaMonitoriaDto);
}

class UpdateBolsaMonitoriaImplUc implements UpdateBolsaMonitoriaUc {
  final BolsaMonitoriaRepository repository = Modular.get();

  @override
  Future<void> call(BolsaMonitoriaDto bolsaMonitoriaDto) async {
    try {
      await repository.update(bolsaMonitoriaDto);
      asuka.AsukaSnackbar.success('Bolsa editada com sucesso');
    } on BolsaMonitoriaErrors catch (e) {
      asuka.AsukaSnackbar.message(e.errorMessage).show();
    } on Exception catch (e) {
      asuka.AsukaSnackbar.message(e.toString()).show();
    }
  }
}
