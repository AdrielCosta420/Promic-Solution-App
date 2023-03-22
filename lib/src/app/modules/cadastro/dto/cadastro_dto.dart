// ignore_for_file: public_member_api_docs, sort_constructors_first

class CadastroDto {
  final String nome;
  final String cpf;
  final String dataNasc;
  final String cep;
  final String emailInstitucional;
  final String password;
  final String? foto;
  final String? uuid;
  CadastroDto({
    required this.nome,
    required this.cpf,
    required this.dataNasc,
    required this.cep,
    required this.emailInstitucional,
    required this.password,
    this.foto,
    this.uuid
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'cpf': cpf,
      'dataNasc': dataNasc,
      'cep': cep,
      'email': emailInstitucional,
      'password': password,
      'foto': foto,
      'uuid': uuid,
    };
  }

  factory CadastroDto.fromMap(Map<String, dynamic> map) {
    return CadastroDto(
      nome: map['nome'] as String,
      cpf: map['cpf'] as String,
      dataNasc: map['dataNasc'] as String,
      cep: map['cep'] as String,
      emailInstitucional: map['email'] as String,
      password: map['password'] as String,
      foto: map['foto'] != null ? map['foto'] as String : null,
      uuid: map['uuid'] as String,
    );
  }



  CadastroDto copyWith({
    String? nome,
    String? cpf,
    String? dataNasc,
    String? cep,
    String? emailInstitucional,
    String? password,
    String? foto,
    String? uuid,
  }) {
    return CadastroDto(
      nome: nome ?? this.nome,
      cpf: cpf ?? this.cpf,
      dataNasc: dataNasc ?? this.dataNasc,
      cep: cep ?? this.cep,
      emailInstitucional: emailInstitucional ?? this.emailInstitucional,
      password: password ?? this.password,
      foto: foto ?? this.foto,
      uuid: uuid ?? this.uuid,
    );
  }
}
