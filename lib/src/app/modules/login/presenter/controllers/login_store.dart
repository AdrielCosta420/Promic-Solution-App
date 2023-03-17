import 'package:mobx/mobx.dart';

class LoginStore {
  final _isLoadingLogin = Observable<bool>(false);
  bool get isLoadingLogin => _isLoadingLogin.value;

  void isLoadingLoginChange() =>
      runInAction(() => _isLoadingLogin.value = !_isLoadingLogin.value);

  final visiblePassword = Observable<bool>(true);

  void visiblePasswordChange() =>
      runInAction(() => visiblePassword.value = !visiblePassword.value);
}
