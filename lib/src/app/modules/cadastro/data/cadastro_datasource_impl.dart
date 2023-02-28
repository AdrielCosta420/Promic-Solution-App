import 'package:promic_app/src/app/modules/cadastro/domain/entities/cadastro.dart';
import 'package:promic_app/src/app/modules/cadastro/domain/errors/cadastro_errors.dart';
import 'package:promic_app/src/app/modules/cadastro/infra/datasource/cadastro_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CadastroDatasourceImpl implements CadastroDatasource {
  @override
  Future<AuthResponse> cadastro(Cadastro cadastro) async {
    try {
      var authResponse = await Supabase.instance.client.auth.signUp(
        password: cadastro.password,
        email: cadastro.email,
        data: {"role": "ALUNO"},
        );

      return authResponse;
    } on AuthException catch (_) {
      throw CadastroErrors(errorMessage: 'Erro ao fazer Cadastro.');
    } on Exception catch (_) {
      throw CadastroErrors(errorMessage: 'Erro desconhecido ao fazer Cadastro');
    }
  }
}
