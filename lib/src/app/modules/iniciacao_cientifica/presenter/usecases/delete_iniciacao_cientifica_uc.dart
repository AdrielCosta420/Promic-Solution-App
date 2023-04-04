import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/entities/iniciacao_cientifica.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/errors/iniciacao_cientifica_errors.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/infra/repositories/iniciacao_cientifica_repository.dart';

abstract class DeleteIniciacaoCientificaUc {
  Future<void> call(IniciacaoCientifica iniciacaoCientifica);
}

class DeleteIniciacaoCientificaImplUc implements DeleteIniciacaoCientificaUc {
  IniciacaoCientificaRepository repository = Modular.get();

  @override
  Future<void> call(IniciacaoCientifica iniciacaoCientifica) async{
    try {
       await repository.deleteIc(iniciacaoCientifica);
       asuka.AsukaSnackbar.success('Iniciação Científica deletada com sucesso').show();
    }on IniciacaoCientificaErrors catch (_) {
       asuka.AsukaSnackbar.alert('Erro ao deletar Iniciação Científica').show();
    }
  }
}
