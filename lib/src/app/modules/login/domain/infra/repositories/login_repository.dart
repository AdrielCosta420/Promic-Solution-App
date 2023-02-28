import 'package:firebase_auth/firebase_auth.dart';
import 'package:promic_app/src/app/modules/login/domain/entities/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginRepository {
  Future<AuthResponse> login(Login login);
}
