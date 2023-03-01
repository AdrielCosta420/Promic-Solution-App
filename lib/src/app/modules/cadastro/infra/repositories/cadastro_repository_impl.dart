import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/cadastro/dto/cadastro_dto.dart';
import 'package:promic_app/src/app/modules/cadastro/infra/datasource/cadastro_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/errors/cadastro_errors.dart';
import '../../domain/infra/repositories/cadastro_repository.dart';

class CadastroRepositoryImpl implements CadastroRepository {
  final CadastroDatasource datasource = Modular.get();

  @override
  Future<AuthResponse> cadastro(CadastroDto cadastroDto) async {
    try {
  return await datasource.cadastro(cadastroDto);
} on AuthException catch (_) {
      throw CadastroErrors(errorMessage: 'Erro ao fazer Cadastro.');
    } on Exception catch (_) {
      throw CadastroErrors(errorMessage:'Erro desconhecido ao fazer Cadastro');
    }
  }
}
