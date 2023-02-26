import 'package:firebase_auth/firebase_auth.dart';
import 'package:promic_app/src/app/modules/cadastro/domain/entities/cadastro.dart';

abstract class CadastroDatasource {
  Future<UserCredential> cadastro(Cadastro cadastro);
}
