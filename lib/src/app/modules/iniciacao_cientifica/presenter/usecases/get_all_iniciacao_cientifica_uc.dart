import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/entities/iniciacao_cientifica.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/errors/iniciacao_cientifica_errors.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/infra/repositories/iniciacao_cientifica_repository.dart';

abstract class GetAllIniciacaoCientificaUc {
  Future<List<IniciacaoCientifica>> call();
}

class GetAllIniciacaoCientificaImplUc implements GetAllIniciacaoCientificaUc {
  IniciacaoCientificaRepository repository = Modular.get();

  @override
  Future<List<IniciacaoCientifica>> call() async {
    try {
      return await repository.getAllIc();
    } on IniciacaoCientificaErrors catch (_) {
      asuka.AsukaSnackbar.warning('Erro ao buscar Iniciações Cíentificas')
          .show();
      rethrow;
    } on Exception catch(e) {
      asuka.AsukaSnackbar.alert(e.toString()).show();
      rethrow;
    }
  }
}
