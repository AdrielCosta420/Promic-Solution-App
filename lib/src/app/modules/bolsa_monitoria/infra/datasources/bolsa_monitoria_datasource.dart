
import '../../dto/bolsa_monitoria_dto.dart';

abstract class BolsaMonitoriaDatasource {
  Future<Map<String, dynamic>> save(BolsaMonitoriaDto bolsaMonitoriaDto);
  Future<Map<String, dynamic>> update(BolsaMonitoriaDto bolsaMonitoriaDto);
  Future<String> delete(BolsaMonitoriaDto bolsaMonitoriaDto);
  Future<List<Map<String, dynamic>>> getAll();
}
