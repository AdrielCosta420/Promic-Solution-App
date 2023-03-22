import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/bolsa_monitoria_module.dart';
import 'package:promic_app/src/app/modules/cadastro/cadastro_module.dart';
import 'package:promic_app/src/app/modules/home/home_module.dart';
import 'package:promic_app/src/app/modules/login/login_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        LoginModule(),
        BolsaMonitoriaModule(),
        HomeModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/cadastro', module: CadastroModule()),
        ModuleRoute('/bolsa', module: BolsaMonitoriaModule()),
      ];
}
