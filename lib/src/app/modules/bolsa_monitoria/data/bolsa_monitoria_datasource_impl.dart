import '../dto/bolsa_monitoria_dto.dart';
import '../infra/datasources/bolsa_monitoria_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BolsaMonitoriaDatasourceImpl implements BolsaMonitoriaDatasource {

  @override
  Future<PostgrestResponse> adicionar(
      BolsaMonitoriaDto bolsaMonitoriaDto) async {
    return await Supabase.instance.client.from('bolsaMonitoria').insert({
      bolsaMonitoriaDto.nomeOrientador,
      bolsaMonitoriaDto.cargoOrientador,
      bolsaMonitoriaDto.descricaoBolsa,
      bolsaMonitoriaDto.campusBolsa,
    });
  }

  @override
  Future<void> delete(BolsaMonitoriaDto bolsaMonitoriaDto) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<String> save(BolsaMonitoriaDto bolsaMonitoriaDto) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
