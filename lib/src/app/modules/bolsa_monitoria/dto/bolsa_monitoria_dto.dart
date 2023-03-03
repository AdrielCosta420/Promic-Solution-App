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
      id: map['id'] as int,
      nomeOrientador: map['nomeOrientador'] as String,
      cargoOrientador: map['cargoOrientador'] as String,
      descricaoBolsa: map['descricaoBolsa'] as String,
      campusBolsa: map['campusBolsa'] as String,
    );
  }
}
