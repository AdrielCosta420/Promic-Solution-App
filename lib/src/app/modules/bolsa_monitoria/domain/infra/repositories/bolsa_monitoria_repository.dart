import '../../../dto/bolsa_monitoria_dto.dart';

abstract class BolsaMonitoriaRepository {
  Future<BolsaMonitoriaDto> save(BolsaMonitoriaDto bolsaMonitoriaDto);
  Future<BolsaMonitoriaDto> update(BolsaMonitoriaDto bolsaMonitoriaDto);
  Future<String> delete(BolsaMonitoriaDto bolsaMonitoriaDto);
  Future<List<BolsaMonitoriaDto>> getAll();
}