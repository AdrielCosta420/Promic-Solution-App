import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class VerificarUsuarioUc {
  void didChangeDependencies();
  Future<void> redirect();
}

class VerificarUsuarioImplUc implements VerificarUsuarioUc {
  Supabase supabase = Supabase.instance;
  bool _redirectCalled = false;

  @override
  void didChangeDependencies() {
    addAuthListener();
    redirect();
  }

  @override
  Future<void> redirect() async {
    await Future.delayed(Duration.zero);
    if (_redirectCalled) {
      return;
    }
    _redirectCalled = true;
    final session = supabase.client.auth.currentSession;
    if (session != null) {
      Modular.to.pushReplacementNamed('/home/');
    } else {
      Modular.to.pushReplacementNamed('/');
    }
  }

  void addAuthListener() {
    supabase.client.auth.onAuthStateChange.listen((event) {
      if (event == AuthChangeEvent.signedIn) {
        Modular.to.pushReplacementNamed('/home/');
      } else if (event == AuthChangeEvent.signedOut) {
        Modular.to.pushReplacementNamed('/');
      }
    });
  }
}
