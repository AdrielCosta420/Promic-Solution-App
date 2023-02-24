// ignore_for_file: public_member_api_docs, sort_constructors_first
class CadastroErrors implements Exception {
  String errorMessage;
  String? statusCode;
  String? stackTracke;
  CadastroErrors({
    required this.errorMessage,
    this.statusCode,
    this.stackTracke,
  });
}
