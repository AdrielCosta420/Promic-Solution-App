import 'package:flutter_modular/flutter_modular.dart';
import 'package:postgrest/src/types.dart';
import 'package:postgrest/src/postgrest_builder.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/errors/bolsa_monitoria_errors.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/infra/repositories/bolsa_monitoria_repository.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/dto/bolsa_monitoria_dto.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/infra/datasources/bolsa_monitoria_datasource.dart';

class BolsaMonitoriaRepositoryImpl implements BolsaMonitoriaRepository {
  final BolsaMonitoriaDatasource datasource = Modular.get();

  @override
  Future<void> delete(BolsaMonitoriaDto bolsaMonitoriaDto) async {
    try {
      await datasource.delete(bolsaMonitoriaDto);
    } on BolsaMonitoriaErrors catch (_) {
      throw 'Erro ao Deletar bolsa';
    } on Exception catch (_) {
      throw 'Erro ao desconhecido ao deletar Bolsa de Monitoria';
    }
  }

  @override
  Future<PostgrestResponse> save(BolsaMonitoriaDto bolsaMonitoriaDto) async {
    try {
      return await datasource.save(bolsaMonitoriaDto);
    } on BolsaMonitoriaErrors catch (_) {
      throw 'Erro ao adicionar Bolsa';
    } on Exception catch (_) {
      throw 'Erro desconhecido ao adicionar Bolsa de Monitoria';
    }
  }

  @override
  Future<PostgrestFilterBuilder> update(
      BolsaMonitoriaDto bolsaMonitoriaDto) async {
    try {
      return await datasource.update(bolsaMonitoriaDto);
    } on BolsaMonitoriaRepository catch (_) {
      throw 'Erro ao editar Bolsa de Monitoria';
    }
  }
}
