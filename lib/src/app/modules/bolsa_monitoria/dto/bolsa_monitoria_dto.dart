class BolsaMonitoriaDto {
  final String? nomeOrientador;
  final String? cargoOrientador;
  final String? descricaoBolsa;
  final String? campusBolsa;
  BolsaMonitoriaDto({
    this.nomeOrientador,
    this.cargoOrientador,
    this.descricaoBolsa,
    this.campusBolsa,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nomeOrientador': nomeOrientador,
      'cargoOrientador': cargoOrientador,
      'descricaoBolsa': descricaoBolsa,
      'campusBolsa': campusBolsa,
    };
  }

  factory BolsaMonitoriaDto.fromMap(Map<String, dynamic> map) {
    return BolsaMonitoriaDto(
      nomeOrientador: map['nomeOrientador'] as String,
      cargoOrientador: map['cargoOrientador'] as String,
      descricaoBolsa: map['descricaoBolsa'] as String,
      campusBolsa: map['campusBolsa'] as String,
    );
  }
}
