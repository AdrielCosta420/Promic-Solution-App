import 'package:mobx/mobx.dart';

class BolsaMonitoriaStore {
  final _isLoadingBolsa = Observable<bool>(false);
  bool get isLoadingBolsa => _isLoadingBolsa.value;

  void isLoadingBolsaChange(bool value) =>
      runInAction(() => _isLoadingBolsa.value = !_isLoadingBolsa.value);
}
