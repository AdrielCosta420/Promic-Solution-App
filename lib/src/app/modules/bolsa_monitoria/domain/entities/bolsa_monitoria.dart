class BolsaMonitoria {
  final String titulo;
  final String orientador;
  final String? campus;
  final String? cargo;
  BolsaMonitoria({
    required this.titulo,
    required this.orientador,
    this.campus,
    this.cargo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titulo': titulo,
      'orientador': orientador,
      'campus': campus,
      'cargo': cargo,
    };
  }

  factory BolsaMonitoria.fromMap(Map<String, dynamic> map) {
    return BolsaMonitoria(
      titulo: map['titulo'] as String,
      orientador: map['orientador'] as String,
      campus: map['campus'] as String,
      cargo: map['cargo'] as String,
    );
  }
}
