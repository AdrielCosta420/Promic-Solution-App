import 'package:promic_app/src/app/modules/cadastro/dto/cadastro_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../entities/cadastro.dart';

abstract class CadastroRepository {
  Future<AuthResponse> cadastro(CadastroDto cadastroDto);
  
}