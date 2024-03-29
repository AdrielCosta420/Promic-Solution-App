import 'package:promic_app/src/app/common/value_objects/value_objects.dart';

class Login implements ValueObjects {
  final String matricula;
  final String password;
  Login({
    required this.matricula,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'matricula': matricula,
      'password': password,
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      matricula: map['matricula'] as String,
      password: map['password'] as String,
    );
  }

  @override
  String? valitador(String? valor) {
    if (matricula.isEmpty || password.isEmpty) {
      return 'Campo obrigatório, não pode está vazio';
    }
    return null;
  }

  

}
