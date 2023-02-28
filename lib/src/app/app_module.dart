import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/cadastro/cadastro_module.dart';
import 'package:promic_app/src/app/modules/home/home_module.dart';
import 'package:promic_app/src/app/modules/login/login_module.dart';


class AppModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
    
  ];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/cadastro', module: CadastroModule())
      ];
}
