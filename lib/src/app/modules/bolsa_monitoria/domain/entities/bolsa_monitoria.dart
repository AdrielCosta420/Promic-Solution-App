// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
      campus: map['campus'] != null ? map['campus'] as String : null,
      cargo: map['cargo'] != null ? map['cargo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BolsaMonitoria.fromJson(String source) => BolsaMonitoria.fromMap(json.decode(source) as Map<String, dynamic>);
}
