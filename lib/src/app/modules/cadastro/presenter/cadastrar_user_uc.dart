import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/cadastro/domain/errors/cadastro_errors.dart';
import 'package:promic_app/src/app/modules/cadastro/domain/infra/repositories/cadastro_repository.dart';
import 'package:promic_app/src/app/modules/cadastro/dto/cadastro_dto.dart';

abstract class CadastrarUserUc {
  Future<void> call(CadastroDto cadastroDto);
}

class CadastrarUserImplUc implements CadastrarUserUc {
  final CadastroRepository repository = Modular.get();

  @override
  Future<void> call(CadastroDto cadastroDto) async {
    try {
      final userCredential = await repository.cadastro(cadastroDto);
      if (userCredential.user != null) {
        Modular.to.pushNamed('/home/', arguments: userCredential);
      }
    } on CadastroErrors catch (e) {
      asuka.AsukaSnackbar.alert(e.errorMessage).show();
    }
  }
}
