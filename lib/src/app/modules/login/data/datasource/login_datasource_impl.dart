import 'package:promic_app/src/app/modules/login/domain/entities/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:promic_app/src/app/modules/login/domain/errors/login_errors.dart';
import 'package:promic_app/src/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final supabase = Supabase.instance.client;

  @override
  Future<AuthResponse> login(Login login) async {
    try {
      var authResponse = await Supabase.instance.client.auth.signInWithPassword(
        //TODO LOGIN COM emailInstituicional
        email: "${login.matricula}",
        password: login.password,
        // data: {"role": "ALUNO"},
      );

      print(authResponse.user?.userMetadata?["role"]);

      return authResponse;

      // var signUp = await supabase.auth.signUp(
      //   email: "adrielsilva_1990@hotmail.com",
      //   password: 'ai meu deus',
      //   data: {
      //     "nome": "Adriel",
      //     "idade": 45,
      //     "matricula": "2332131154344",
      //   },
      // );
      // return signUp;
    } on AuthException catch (e) {
      throw LoginErrors(errorMessange: e.message);
    } on Exception catch (_) {
      throw LoginErrors(errorMessange: 'Erro desconhecido ao fazer Login');
    }
  }

  @override
  Future<void> loggoff() async {
    try {
      await supabase.auth.signOut();
    } on LoginErrors catch (_) {
      rethrow;
    }
  }
}
