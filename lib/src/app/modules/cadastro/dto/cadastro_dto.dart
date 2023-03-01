class CadastroDto {
  final String nome;
  final String cpf;
  final String dataNasc;
  final String cep;
  final String emailInstitucional;
  final String password;
  CadastroDto({
    required this.nome,
    required this.cpf,
    required this.dataNasc,
    required this.cep,
    required this.emailInstitucional,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'cpf': cpf,
      'dataNasc': dataNasc,
      'cep': cep,
      'emailInstitucional': emailInstitucional,
      'password': password,
    };
  }

  factory CadastroDto.fromMap(Map<String, dynamic> map) {
    return CadastroDto(
      nome: map['nome'] as String,
      cpf: map['cpf'] as String,
      dataNasc: map['dataNasc'] as String,
      cep: map['cep'] as String,
      emailInstitucional: map['emailInstitucional'] as String,
      password: map['password'] as String,
    );
  }
}
