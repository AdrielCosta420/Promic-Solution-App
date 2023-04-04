import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/errors/iniciacao_cientifica_errors.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/infra/datasources/iniciacao_cientifica_datasource.dart';

import '../../domain/entities/iniciacao_cientifica.dart';
import '../../domain/infra/repositories/iniciacao_cientifica_repository.dart';

class IniciacaoCientificaRepositoryImpl
    implements IniciacaoCientificaRepository {
  IniciacaoCientificaDatasource datasource = Modular.get();

  @override
  Future<String> deleteIc(IniciacaoCientifica iniciacaoCientifica) async {
    try {
      return await datasource.deleteIc(iniciacaoCientifica);
    } on IniciacaoCientificaErrors catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<IniciacaoCientifica>> getAllIc() async {
    try {
      var lista = await datasource.getAllIc();
      List<IniciacaoCientifica> listaIc = [];

      for (var element in lista) {
        listaIc.add(IniciacaoCientifica.fromMap(element));
      }
      return listaIc;
    } on IniciacaoCientificaErrors catch (_) {
      rethrow;
    }
  }

  @override
  Future<IniciacaoCientifica> saveIc(
      IniciacaoCientifica iniciacaoCientifica) async {
    try {
      var map = await datasource.saveIc(iniciacaoCientifica);
      return IniciacaoCientifica.fromMap(map);
    } on IniciacaoCientificaErrors catch (_) {
      rethrow;
    }
  }

  @override
  Future<IniciacaoCientifica> updateIc(
      IniciacaoCientifica iniciacaoCientifica) async {
    try {
      var map = await datasource.updateIc(iniciacaoCientifica);
      return IniciacaoCientifica.fromMap(map);
    } on IniciacaoCientificaErrors catch (_) {
      rethrow;
    }
  }
}
