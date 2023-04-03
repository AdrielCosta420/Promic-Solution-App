import 'dart:convert';

class IniciacaoCientifica {
  final int? id;
  final String cursoIc;
  final String tituloIc;
  final String orientadorIc;
  final String alunosAprovadosIc;

  IniciacaoCientifica({
    this.id,
    required this.cursoIc,
    required this.tituloIc,
    required this.orientadorIc,
    required this.alunosAprovadosIc,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cursoIc': cursoIc,
      'tituloIc': tituloIc,
      'orientadorIc': orientadorIc,
      'alunosAprovadosIc': alunosAprovadosIc,
    };
  }

  factory IniciacaoCientifica.fromMap(Map<String, dynamic> map) {
    return IniciacaoCientifica(
      id: map['id'] as int,
      cursoIc: map['cursoIc'] as String,
      tituloIc: map['tituloIc'] as String,
      orientadorIc: map['orientadorIc'] as String,
      alunosAprovadosIc: map['alunosAprovadosIc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory IniciacaoCientifica.fromJson(String source) =>
      IniciacaoCientifica.fromMap(json.decode(source) as Map<String, dynamic>);
}
