import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/entities/iniciacao_cientifica.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/errors/iniciacao_cientifica_errors.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/infra/datasources/iniciacao_cientifica_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../common/constants/constants_iniciacao_cientifica.dart';

class IniciacaoCientificaDatasourceImpl
    implements IniciacaoCientificaDatasource {
  Supabase supabase = Supabase.instance;

  @override
  Future<String> deleteIc(IniciacaoCientifica iniciacaoCientifica) async {
    return await supabase.client
        .from(collectionIc)
        .delete()
        .match({'id': '${iniciacaoCientifica.id}'})
        .then((value) => 'Sucesso ao excluir IC')
        .onError((error, stackTrace) =>
            throw 'Erro ao excluir ${iniciacaoCientifica.tituloIc}');
  }

  @override
  Future<List<Map<String, dynamic>>> getAllIc() async {
    try {
      PostgrestList listaIc = await supabase.client.from(collectionIc).select();
      return listaIc;
    } on Exception catch (_) {
      throw IniciacaoCientificaErrors(errorMessage: 'Erro ao buscar ICs');
    }
  }

  @override
  Future<Map<String, dynamic>> saveIc(
      IniciacaoCientifica iniciacaoCientifica) async {
    return await supabase.client
        .from(collectionIc)
        .insert(iniciacaoCientifica.toMap())
        .select()
        .single()
        .then((value) => value)
        .onError((error, stackTrace) =>
            throw IniciacaoCientificaErrors(errorMessage: 'Erro ao salvar IC'));
  }

  @override
  Future<Map<String, dynamic>> updateIc(
      IniciacaoCientifica iniciacaoCientifica) async {
    return await supabase.client
        .from(collectionIc)
        .update(iniciacaoCientifica.toMap())
        .select()
        .single()
        .then((value) => value)
        .onError((error, stackTrace) => throw IniciacaoCientificaErrors(
            errorMessage: 'Erro ao atualizar IC'));
  }
}
