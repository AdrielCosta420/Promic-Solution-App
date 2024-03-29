import 'package:promic_app/src/app/modules/bolsa_monitoria/data/bolsa_monitoria_datasource_impl.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/errors/bolsa_monitoria_errors.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/infra/repositories/bolsa_monitoria_repository.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/dto/bolsa_monitoria_dto.dart';


class BolsaMonitoriaRepositoryImpl implements BolsaMonitoriaRepository {
  final BolsaMonitoriaDatasourceImpl datasource;

  BolsaMonitoriaRepositoryImpl(
    this.datasource,
  );

  @override
  Future<String> delete(BolsaMonitoriaDto bolsaMonitoriaDto) async {
    try {
      return await datasource.delete(bolsaMonitoriaDto);
    } on BolsaMonitoriaErrors catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<BolsaMonitoriaDto>> getAll() async {
    try {
      var list = await datasource.getAll();

      List<BolsaMonitoriaDto> listaBolsas = [];

      for (var element in list) {
        listaBolsas.add(BolsaMonitoriaDto.fromMap(element));
      }
      return listaBolsas;
    } on BolsaMonitoriaErrors catch (_) {
      rethrow;
    }
  }

  @override
  Future<BolsaMonitoriaDto> save(BolsaMonitoriaDto bolsaMonitoriaDto) async {
    try {
      var map = await datasource.save(bolsaMonitoriaDto);
      return BolsaMonitoriaDto.fromMap(map);
    } on BolsaMonitoriaDto catch (_) {
      rethrow;
    }
  }

  @override
  Future<BolsaMonitoriaDto> update(BolsaMonitoriaDto bolsaMonitoriaDto) async {
    try {
      var map = await datasource.update(bolsaMonitoriaDto);
      return BolsaMonitoriaDto.fromMap(map);
    } on BolsaMonitoriaDto catch (_) {
      rethrow;
    }
  }
}


/*

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
  Future<void> save(BolsaMonitoriaDto bolsaMonitoriaDto) async {
    try {
      await datasource.save(bolsaMonitoriaDto);
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

  @override
  Future<void> getAll(BolsaMonitoriaDto bolsaMonitoriaDto) async {
    await datasource.getAll(bolsaMonitoriaDto);
  }


*/