import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/entities/iniciacao_cientifica.dart';

abstract class IniciacaoCientificaRepository {
  Future<IniciacaoCientifica> saveIc(IniciacaoCientifica iniciacaoCientifica);
  Future<IniciacaoCientifica> updateIc(IniciacaoCientifica iniciacaoCientifica);
  Future<String> deleteIc(IniciacaoCientifica iniciacaoCientifica);
  Future<List<IniciacaoCientifica>> getAllIc();
}
