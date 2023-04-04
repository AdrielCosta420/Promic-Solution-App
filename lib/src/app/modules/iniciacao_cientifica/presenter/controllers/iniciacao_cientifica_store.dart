import 'package:mobx/mobx.dart';

class IniciacaoCientificaStore {
  final _isLoading = Observable<bool>(true);
  bool get isLoading => _isLoading.value;

  void isLoadingChange(bool value) =>
      runInAction(() => _isLoading.value = !_isLoading.value);
}
