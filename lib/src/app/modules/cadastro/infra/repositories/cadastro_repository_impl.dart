import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/cadastro/domain/entities/cadastro.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:promic_app/src/app/modules/cadastro/infra/datasource/cadastro_datasource.dart';

import '../../domain/errors/cadastro_errors.dart';
import '../../domain/repositories/cadastro_repository.dart';

class CadastroRepositoryImpl implements CadastroRepository {
  final CadastroDatasource datasource = Modular.get();

  @override
  Future<UserCredential> cadastro(Cadastro cadastro) async {
    try {
  return await datasource.cadastro(cadastro);
} on FirebaseAuthException catch (_) {
      throw CadastroErrors(errorMessage: 'Erro ao fazer Cadastro.');
    } on Exception catch (_) {
      throw CadastroErrors(errorMessage:'Erro desconhecido ao fazer Cadastro');
    }
  }
}
