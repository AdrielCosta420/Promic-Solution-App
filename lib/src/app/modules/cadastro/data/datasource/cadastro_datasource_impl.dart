import '../../domain/errors/cadastro_errors.dart';
import '../../dto/cadastro_dto.dart';
import '../../infra/datasource/cadastro_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:asuka/asuka.dart' as asuka;

class CadastroDatasourceImpl implements CadastroDatasource {
  Supabase supabase = Supabase.instance;

  @override
  Future<AuthResponse> cadastro(CadastroDto cadastroDto) async {
    try {
      var authResponse = await Supabase.instance.client.auth.signUp(
        password: cadastroDto.password,
        email: cadastroDto.emailInstitucional,
        //  data: {"role": "ALUNO"},
      );

      CadastroDto cadastro = cadastroDto.copyWith(uuid: authResponse.user!.id);
      supabase.client.from("usuario").insert(cadastro.toMap()).select();

      // var usuario = authResponse.user;

      //    var ultId = await Supabase.instance.client.from('usuario').select('id').order('id',ascending: false);

      /* Cadastro cadastro = Cadastro(
        id: 0,
        nome: cadastroDto.nome,
        email: cadastroDto.emailInstitucional,
        password: BCrypt.hashpw(cadastroDto.password, BCrypt.gensalt()),
        dataNasc: cadastroDto.dataNasc,
        matricula: '',
        cpf: cadastroDto.cpf,
        cep: cadastroDto.cep,
      );*/

      return authResponse;
    } on AuthException catch (_) {
      throw CadastroErrors(errorMessage: 'Erro ao fazer Cadastro.');
    } on Exception catch (_) {
      throw CadastroErrors(errorMessage: 'Erro desconhecido ao fazer Cadastro');
    }
  }
}
