import 'package:flutter/material.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/errors/bolsa_monitoria_errors.dart';
import '../../../common/tables/bolsa_monitoria_table.dart';
import '../dto/bolsa_monitoria_dto.dart';
import '../infra/datasources/bolsa_monitoria_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BolsaMonitoriaDatasourceImpl implements BolsaMonitoriaDatasource {
  Supabase supabase = Supabase.instance;

  @override
  Future<PostgrestResponse> save(BolsaMonitoriaDto bolsaMonitoriaDto) async {
    try {
      return await supabase.client.from('bolsaMonitoria').insert({
        'nome_orientador': bolsaMonitoriaDto.nomeOrientador,
        'cargo_orientador': bolsaMonitoriaDto.cargoOrientador,
        'descricao_bolsa': bolsaMonitoriaDto.descricaoBolsa,
        'campus_bolsa': bolsaMonitoriaDto.campusBolsa
      });
    } on PostgrestException catch (_) {
      throw BolsaMonitoriaErrors(
          errorMessage: 'Erro ao adicionar Bolsa de Monitoria');
    } on Exception catch (_) {
      throw 'Erro desconhecido ao deletar Bolsa de Monitoria';
    }
  }

  @override
  Future<void> delete(BolsaMonitoriaDto bolsaMonitoriaDto) async {
    try {
      await supabase.client.from(bolsaMonitoriaTable).delete();
    } on PostgrestException catch (_) {
      throw BolsaMonitoriaErrors(
          errorMessage: 'Erro ao adicionar Bolsa de Monitoria');
    } on Exception catch (_) {
      throw 'Erro desconhecido ao deletar Bolsa de Monitoria';
    }
  }

  @override
  Future<PostgrestFilterBuilder> update(
      BolsaMonitoriaDto bolsaMonitoriaDto) async {
    try {
      final values = {
        'nome_orientador': bolsaMonitoriaDto.nomeOrientador,
        'cargo_orientador': bolsaMonitoriaDto.cargoOrientador,
        'descricao_bolsa': bolsaMonitoriaDto.descricaoBolsa,
        'campus_bolsa': bolsaMonitoriaDto.campusBolsa,
      };
      final filterBuilder = supabase.client
          .from(bolsaMonitoriaTable)
          .update(values)
          .eq('id', bolsaMonitoriaDto.id);

      return await filterBuilder;
    } on PostgrestException catch (_) {
      throw BolsaMonitoriaErrors(
          errorMessage: 'Erro ao editar Bolsa de Monitoria');
    } on Exception catch (_) {
      throw 'Erro desconhecido ao editar Bolsa de Monitoria';
    }
  }
}
