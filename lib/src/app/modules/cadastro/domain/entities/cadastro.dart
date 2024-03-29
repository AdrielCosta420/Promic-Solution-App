import 'package:promic_app/src/app/common/value_objects/value_objects.dart';
import 'package:string_validator/string_validator.dart' as validator;

class Cadastro implements ValueObjects {
  final int id;
  final String nome;
  final String email;
  final String password;
  final String dataNasc;
  final String matricula;
  final String cpf;
  final String cep;
  Cadastro({
    required this.id,
    required this.nome,
    required this.email,
    required this.password,
    required this.dataNasc,
    required this.matricula,
    required this.cpf,
    required this.cep,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'email': email,
      'dataNasc': dataNasc,
      'matricula': matricula,
      'cpf': cpf,
      'cep': cep,
    };
  }

  factory Cadastro.fromMap(Map<String, dynamic> map) {
    return Cadastro(
      id: map['id'] as int,
      nome: map['nome'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      dataNasc: map['dataNasc'] as String,
      matricula: map['matricula'] as String,
      cpf: map['cpf'] as String,
      cep: map['cep'] as String,
    );
  }

  @override
  String? valitador(String? valor) {
    if (nome.isEmpty ||
        email.isEmpty || validator.isEmail(email) ||
        dataNasc.isEmpty ||
        matricula.isEmpty ||
        cpf.isEmpty ||
        cep.isEmpty) {
      return 'Campo obrigatório, não pode estar vazio';
    }
    return null;
  }
}
