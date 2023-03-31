import 'package:mobx/mobx.dart';

class CadastroStore {
  final _visiblePassword = Observable<bool>(false);
  bool get visiblePassword => _visiblePassword.value;

  void visiblePasswordChange() =>
      runInAction(() => _visiblePassword.value = !_visiblePassword.value);
}
