
import 'package:firebase_auth/firebase_auth.dart';

import '../../entities/cadastro.dart';

abstract class CadastroRepository {
  Future<UserCredential> cadastro(Cadastro cadastro);
  
}