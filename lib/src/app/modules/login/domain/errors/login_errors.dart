// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginErrors implements Exception{
  final String errorMessange;
  final String? stackTrace;
 
  LoginErrors({
    required this.errorMessange,
    this.stackTrace,

  });
}
