
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/bolsa_monitoria_module.dart';
import 'package:promic_app/src/app/modules/home/ui/home_page.dart';

import '../bolsa_monitoria/domain/usecases/get_all_bolsa_monitoria_uc.dart';

class HomeModule extends Module{

  @override
  List<Module> get imports => [
    BolsaMonitoriaModule()
  ];


  @override
  List<Bind> get binds => [
    
  ];

  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomePage()),
  ];
}