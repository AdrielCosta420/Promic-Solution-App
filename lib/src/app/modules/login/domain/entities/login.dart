class Login {
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
}
