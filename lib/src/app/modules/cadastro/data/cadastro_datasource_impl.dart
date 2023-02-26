import 'package:promic_app/src/app/modules/cadastro/domain/entities/cadastro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:promic_app/src/app/modules/cadastro/domain/errors/cadastro_errors.dart';
import 'package:promic_app/src/app/modules/cadastro/infra/datasource/cadastro_datasource.dart';

class CadastroDatasourceImpl implements CadastroDatasource {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<UserCredential> cadastro(Cadastro cadastro) async {
    try {
      return await auth.createUserWithEmailAndPassword(
          email: cadastro.email, password: cadastro.password);
    } on FirebaseAuthException catch (_) {
      throw CadastroErrors(errorMessage: 'Erro ao fazer Cadastro.');
    } on Exception catch (_) {
      throw CadastroErrors(errorMessage:'Erro desconhecido ao fazer Cadastro');
    }
  }
}
