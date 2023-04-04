import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import '../../domain/entities/iniciacao_cientifica.dart';
import '../../domain/errors/iniciacao_cientifica_errors.dart';
import '../../domain/infra/repositories/iniciacao_cientifica_repository.dart';

abstract class SaveIniciacaoCientificaUc {
  Future<void> call(IniciacaoCientifica iniciacaoCientifica);
}

class SaveIniciacaoCientificaImplUc implements SaveIniciacaoCientificaUc {
  IniciacaoCientificaRepository repository = Modular.get();
  @override
  Future<void> call(IniciacaoCientifica iniciacaoCientifica) async {
    try {
      await repository.saveIc(iniciacaoCientifica);
      asuka.AsukaSnackbar.success('Iniciação Científica postada com sucesso')
          .show();
    } on IniciacaoCientificaErrors catch (e) {
      asuka.AsukaSnackbar.alert(e.errorMessage).show();
    } on Exception catch (e) {
      asuka.AsukaSnackbar.alert(e.toString()).show();
    }
  }
}
