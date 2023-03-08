import 'package:flutter_modular/flutter_modular.dart';
import 'controllers/bolsa_monitoria_store.dart';
import 'data/bolsa_monitoria_datasource_impl.dart';
import 'domain/infra/repositories/bolsa_monitoria_repository.dart';
import 'domain/usecases/delete_bolsa_monitoria_uc.dart';
import 'domain/usecases/get_all_bolsa_monitoria_uc.dart';
import 'domain/usecases/save_bolsa_monitoria_uc.dart';
import 'domain/usecases/update_bolsa_monitoria_uc.dart';
import 'infra/datasources/bolsa_monitoria_datasource.dart';
import 'infra/repostories/bolsa_monitoria_repository_impl.dart';
import 'ui/divulgar_bolsas_page.dart';

class BolsaMonitoriaModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<BolsaMonitoriaDatasource>((i) => BolsaMonitoriaDatasourceImpl(), export: true),
        Bind.lazySingleton<BolsaMonitoriaRepository>((i) => BolsaMonitoriaRepositoryImpl(i.get()), export: true),
        Bind.lazySingleton<SaveBolsaMonitoriaUc>((i) => SaveBolsaMonitoriaImplUc()),
        Bind.lazySingleton<UpdateBolsaMonitoriaUc>((i) => UpdateBolsaMonitoriaImplUc()),
        Bind.lazySingleton<DeleteBolsaMonitoriaUc>((i) => DeleteBolsaMonitoriaImplUc(), export: true),
        Bind.lazySingleton<GetAllBolsaMonitoriaUc>((i) => GetAllBolsaMonitoriaImplUc(i.get()),export: true),
        Bind.lazySingleton((i) => BolsaMonitoriaStore())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const DivulgarBolsasPage()),
      ];
}
