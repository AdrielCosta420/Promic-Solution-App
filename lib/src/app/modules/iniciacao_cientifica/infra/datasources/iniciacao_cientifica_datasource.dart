import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/entities/iniciacao_cientifica.dart';

abstract class IniciacaoCientificaDatasource {
  Future<Map<String, dynamic>> saveIc(IniciacaoCientifica iniciacaoCientifica);
  Future<Map<String, dynamic>> updateIc(
      IniciacaoCientifica iniciacaoCientifica);
  Future<String> deleteIc(IniciacaoCientifica iniciacaoCientifica);
  Future<List<Map<String, dynamic>>> getAllIc();
}
