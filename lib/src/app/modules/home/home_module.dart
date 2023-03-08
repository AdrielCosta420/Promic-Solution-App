
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/bolsa_monitoria_module.dart';
import 'package:promic_app/src/app/modules/login/login_module.dart';
import 'controllers/home_store.dart';
import 'ui/home_page.dart';

class HomeModule extends Module{

  @override
  List<Module> get imports => [
    BolsaMonitoriaModule(),
    LoginModule(),
  ];


  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => HomeStore())
  ];

  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomePage()),
  ];
}