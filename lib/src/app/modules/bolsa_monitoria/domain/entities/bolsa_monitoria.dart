class BolsaMonitoria {
  final String titulo;
  final String orientador;
  final String campus;
  BolsaMonitoria({
    required this.titulo,
    required this.orientador,
    required this.campus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titulo': titulo,
      'orientador': orientador,
      'campus': campus,
    };
  }

  factory BolsaMonitoria.fromMap(Map<String, dynamic> map) {
    return BolsaMonitoria(
      titulo: map['titulo'] as String,
      orientador: map['orientador'] as String,
      campus: map['campus'] as String,
    );
  }
}
