// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BolsaMonitoriaDto {
  final int? id;
  final String? nomeOrientador;
  final String? cargoOrientador;
  final String? descricaoBolsa;
  final String? campusBolsa;
  BolsaMonitoriaDto({
    this.id,
    this.nomeOrientador,
    this.cargoOrientador,
    this.descricaoBolsa,
    this.campusBolsa,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome_orientador': nomeOrientador,
      'cargo_orientador': cargoOrientador,
      'descricao_bolsa': descricaoBolsa,
      'campus_bolsa': campusBolsa,
    };
  }

  factory BolsaMonitoriaDto.fromMap(Map<String, dynamic> map) {
    return BolsaMonitoriaDto(
      id: map['id'] != null ? map['id'] as int : null,
      nomeOrientador: map['nome_orientador'] != null ? map['nome_orientador'] as String : null,
      cargoOrientador: map['cargo_orientador'] != null ? map['cargo_orientador'] as String : null,
      descricaoBolsa: map['descricao_bolsa'] != null ? map['descricao_bolsa'] as String : null,
      campusBolsa: map['campus_bolsa'] != null ? map['campus_bolsa'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BolsaMonitoriaDto.fromJson(String source) => BolsaMonitoriaDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
