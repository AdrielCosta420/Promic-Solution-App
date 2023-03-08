import 'package:mobx/mobx.dart';

class HomeStore {
  final _isLoadingHome = Observable<bool>(true);
  bool get isLoadingHome => _isLoadingHome.value;

  void isLoadingHomeChange(bool value) =>
      runInAction(() => _isLoadingHome.value = !_isLoadingHome.value);
}
