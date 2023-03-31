import 'package:promic_app/src/app/modules/login/domain/entities/login.dart';
import '../../domain/errors/login_errors.dart';
import '../../infra/datasources/login_datasource.dart';
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




     var user = authResponse.user;
        var role = user?.userMetadata?["role"];

        // Definindo o papel do usuário
    //    var client = Supabase.instance.client;
    //    var response = await client.from("auth.users").update({
     //       "role": role
     //   }).match({"id": user?.id});

       // String papel = authResponse.user?.userMetadata?["tipo"] == 'aluno' ? 'aluno' : 'professor';
       // await Supabase.instance.client.auth.setRole(papel, authResponse.user!.id);





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
