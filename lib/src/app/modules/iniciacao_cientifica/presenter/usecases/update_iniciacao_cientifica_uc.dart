import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/entities/iniciacao_cientifica.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/errors/iniciacao_cientifica_errors.dart';
import '../../domain/infra/repositories/iniciacao_cientifica_repository.dart';

abstract class UpdateIniciacaoCientificaUc {
  Future<void> call(IniciacaoCientifica iniciacaoCientifica);
}

class UpdateIniciacaoCientificaImplUc implements UpdateIniciacaoCientificaUc {
  IniciacaoCientificaRepository repository = Modular.get();
  @override
  Future<void> call(IniciacaoCientifica iniciacaoCientifica) async {
    try {
      await repository.updateIc(iniciacaoCientifica);
      asuka.AsukaSnackbar.success(
          'Iniciação Científica atualizada com sucesso');
    } on IniciacaoCientificaErrors catch (e) {
      asuka.AsukaSnackbar.alert(e.errorMessage).show();
    } on Exception catch (e) {
      asuka.AsukaSnackbar.alert(e.toString()).show();
    }
  }
}
