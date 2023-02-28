import 'package:supabase_flutter/supabase_flutter.dart';
import '../../entities/cadastro.dart';

abstract class CadastroRepository {
  Future<AuthResponse> cadastro(Cadastro cadastro);
  
}