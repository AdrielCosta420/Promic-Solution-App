
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/home/ui/home_page.dart';

import '../bolsa_monitoria/domain/usecases/get_all_bolsa_monitoria_uc.dart';

class HomeModule extends Module{
  @override
  List<Bind> get binds => [
     Bind.lazySingleton<GetAllBolsaMonitoriaUc>((i) => GetAllBolsaMonitoriaImplUc())
  ];

   

 // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomePage()),
  ];
}