import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Profile {
  String nome;
  String email;
  String foto;
  Profile({
    required this.nome,
    required this.email,
    required this.foto,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'email': email,
      'foto': foto,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      nome: map['nome'] as String,
      email: map['email'] as String,
      foto: map['foto'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}
