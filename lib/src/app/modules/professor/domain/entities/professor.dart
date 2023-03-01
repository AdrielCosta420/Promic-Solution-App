class Professor {
  final String? nome;
  final String? curso;
  Professor({
    required this.nome,
    required this.curso,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'curso': curso,
    };
  }

  factory Professor.fromMap(Map<String, dynamic> map) {
    return Professor(
      nome: map['nome'] as String,
      curso: map['curso'] as String,
    );
  }
}
