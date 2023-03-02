import 'package:supabase_flutter/supabase_flutter.dart';

import '../../dto/bolsa_monitoria_dto.dart';

abstract class BolsaMonitoriaDatasource {
  Future<PostgrestResponse> adicionar(BolsaMonitoriaDto bolsaMonitoriaDto);
  Future<String> save(BolsaMonitoriaDto bolsaMonitoriaDto);
  Future<void> delete(BolsaMonitoriaDto bolsaMonitoriaDto);
}
