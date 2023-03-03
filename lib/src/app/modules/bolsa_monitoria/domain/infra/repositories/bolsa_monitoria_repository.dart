import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../dto/bolsa_monitoria_dto.dart';

abstract class BolsaMonitoriaRepository {
  Future<PostgrestResponse> save(BolsaMonitoriaDto bolsaMonitoriaDto);
  Future<PostgrestFilterBuilder> update(BolsaMonitoriaDto bolsaMonitoriaDto);
  Future<void> delete(BolsaMonitoriaDto bolsaMonitoriaDto);
}