import 'package:firebase_auth/firebase_auth.dart';
import 'package:promic_app/src/app/modules/cadastro/domain/entities/cadastro.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CadastroDatasource {
  Future<AuthResponse> cadastro(Cadastro cadastro);
}
