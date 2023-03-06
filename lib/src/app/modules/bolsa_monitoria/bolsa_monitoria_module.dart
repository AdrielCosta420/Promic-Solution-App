import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/data/bolsa_monitoria_datasource_impl.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/infra/repositories/bolsa_monitoria_repository.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/usecases/delete_bolsa_monitoria_uc.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/usecases/get_all_bolsa_monitoria_uc.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/usecases/save_bolsa_monitoria_uc.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/usecases/update_bolsa_monitoria_uc.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/infra/datasources/bolsa_monitoria_datasource.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/infra/repostories/bolsa_monitoria_repository_impl.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/ui/divulgar_bolsas_page.dart';

class BolsaMonitoriaModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<BolsaMonitoriaDatasource>(
            (i) => BolsaMonitoriaDatasourceImpl(),export: true),
        Bind.lazySingleton<BolsaMonitoriaRepository>(
            (i) => BolsaMonitoriaRepositoryImpl(),
            export: true),
        Bind.lazySingleton<SaveBolsaMonitoriaUc>(
            (i) => SaveBolsaMonitoriaImplUc(),
            export: true),
        Bind.lazySingleton<UpdateBolsaMonitoriaUc>(
            (i) => UpdateBolsaMonitoriaImplUc(),
            export: true),
        Bind.lazySingleton<DeleteBolsaMonitoriaUc>(
            (i) => DeleteBolsaMonitoriaImplUc(),
            export: true),
        Bind.lazySingleton<GetAllBolsaMonitoriaUc>(
            (i) => GetAllBolsaMonitoriaImplUc(),
            export: true)
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const DivulgarBolsasPage()),
      ];
}
