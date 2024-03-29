import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/errors/bolsa_monitoria_errors.dart';

import '../../../common/tables/bolsa_monitoria_table.dart';
import '../dto/bolsa_monitoria_dto.dart';
import '../infra/datasources/bolsa_monitoria_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BolsaMonitoriaDatasourceImpl implements BolsaMonitoriaDatasource {
  Supabase supabase = Supabase.instance;

  @override
  Future<String> delete(BolsaMonitoriaDto bolsaMonitoriaDto) async {
    return await supabase.client
        .from(bolsaMonitoriaTable)
        .delete()
        .match({"id": "${bolsaMonitoriaDto.id}"})
        .then((value) => "Sucesso ao excluir bolsa")
        .onError((error, stackTrace) =>
            "Error ao excluir ${bolsaMonitoriaDto.descricaoBolsa}");
  }

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    try {
      PostgrestList list =
          await supabase.client.from(bolsaMonitoriaTable).select();
      return list;
    } on Exception catch (_) {
      throw BolsaMonitoriaErrors(errorMessage: "Erro ao buscar bolsas");
    }
  }

  @override
  Future<Map<String, dynamic>> save(BolsaMonitoriaDto bolsaMonitoriaDto) async {
    return await supabase.client
        .from(bolsaMonitoriaTable)
        .insert(bolsaMonitoriaDto.toMap())
        .select()
        .single()
        .then((value) => value)
        .onError((error, stackTrace) =>
            throw BolsaMonitoriaErrors(errorMessage: "Erro ao salvar bolsas"));
  }

  @override
  Future<Map<String, dynamic>> update(
      BolsaMonitoriaDto bolsaMonitoriaDto) async {
    return await supabase.client
        .from(bolsaMonitoriaTable)
        .update(bolsaMonitoriaDto.toMap())
        .select()
        .single()
        .then((value) => value)
        .onError((error, stackTrace) =>
            throw BolsaMonitoriaErrors(errorMessage: "Erro ao buscar bolsas"));
  }
}





/*

@override
  Future<BolsaMonitoriaDto> save(BolsaMonitoriaDto bolsaMonitoriaDto) async {
    try {
      List insert = await Supabase.instance.client
          .from('BOLSAMONITORIA')
          .insert(bolsaMonitoriaDto.toMap())
          .select();
      Modular.to.pushNamed('/home/');
      return BolsaMonitoriaDto.fromMap(insert.first);
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

  @override
  Future<List<BolsaMonitoriaDto>> getAll(
      BolsaMonitoriaDto bolsaMonitoriaDto) async {
    try {
      return await supabase.client.from('BOLSAMONITORIA').select();
    } on PostgrestException catch (_) {
      throw BolsaMonitoriaErrors(errorMessage: 'Erro ao buscar Bolsas');
    } on Exception catch (_) {
      throw 'Erro desconhecido ao buscar Bolsas';
    }
  }


*/