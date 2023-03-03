import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/errors/bolsa_monitoria_errors.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/infra/repositories/bolsa_monitoria_repository.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/dto/bolsa_monitoria_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SaveBolsaMonitoriaUc {
  Future<PostgrestResponse> call(BolsaMonitoriaDto bolsaMonitoriaDto);
}

class SaveBolsaMonitoriaImplUc implements SaveBolsaMonitoriaUc {
  final BolsaMonitoriaRepository repository = Modular.get();

  @override
  Future<PostgrestResponse> call(BolsaMonitoriaDto bolsaMonitoriaDto) async {
    try {
      var postgrestResponse = await repository.save(bolsaMonitoriaDto);
      asuka.AsukaSnackbar.success('Bolsa postada com sucesso').show();
      
      return postgrestResponse;
    } on BolsaMonitoriaErrors catch (e) {
      asuka.AsukaSnackbar.alert(e.errorMessage).show();
    } on Exception catch (e) {
      asuka.AsukaSnackbar.alert(e.toString()).show();
    }
    throw '';

    //todo quebrei cabeça e fiz isso
  }
}
