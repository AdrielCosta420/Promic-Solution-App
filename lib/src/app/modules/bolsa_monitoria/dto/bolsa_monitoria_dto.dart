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
      'id': id,
      'nomeOrientador': nomeOrientador,
      'cargoOrientador': cargoOrientador,
      'descricaoBolsa': descricaoBolsa,
      'campusBolsa': campusBolsa,
    };
  }

  factory BolsaMonitoriaDto.fromMap(Map<String, dynamic> map) {
    return BolsaMonitoriaDto(
      id: map['id'] != null ? map['id'] as int : null,
      nomeOrientador: map['nomeOrientador'] != null ? map['nomeOrientador'] as String : null,
      cargoOrientador: map['cargoOrientador'] != null ? map['cargoOrientador'] as String : null,
      descricaoBolsa: map['descricaoBolsa'] != null ? map['descricaoBolsa'] as String : null,
      campusBolsa: map['campusBolsa'] != null ? map['campusBolsa'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BolsaMonitoriaDto.fromJson(String source) => BolsaMonitoriaDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
