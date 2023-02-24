class CadastroDto {
  final String nome;
  final String cpf;
  final String dataNasc;
  final String cep;
  CadastroDto({
    required this.nome,
    required this.cpf,
    required this.dataNasc,
    required this.cep,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'cpf': cpf,
      'dataNasc': dataNasc,
      'cep': cep,
    };
  }

  factory CadastroDto.fromMap(Map<String, dynamic> map) {
    return CadastroDto(
      nome: map['nome'] as String,
      cpf: map['cpf'] as String,
      dataNasc: map['dataNasc'] as String,
      cep: map['cep'] as String,
    );
  }
}
