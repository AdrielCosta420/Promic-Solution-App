import 'package:asuka/asuka.dart' as asuka;
import 'package:promic_app/src/app/modules/bolsa_monitoria/dto/bolsa_monitoria_dto.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/infra/repostories/bolsa_monitoria_repository_impl.dart';
import '../errors/bolsa_monitoria_errors.dart';
import '../infra/repositories/bolsa_monitoria_repository.dart';

abstract class GetAllBolsaMonitoriaUc {
  Future<List<BolsaMonitoriaDto>> call();
}

class GetAllBolsaMonitoriaImplUc implements GetAllBolsaMonitoriaUc {
  final BolsaMonitoriaRepositoryImpl repository;

  GetAllBolsaMonitoriaImplUc(this.repository);
  @override
  Future<List<BolsaMonitoriaDto>> call() async {
    try {
      var list = await repository.getAll();
      return list;
    } on BolsaMonitoriaErrors catch (e) {
      asuka.AsukaSnackbar.alert(e.errorMessage).show();
      rethrow;
    } on Exception catch (e) {
      asuka.AsukaSnackbar.alert(e.toString()).show();
      rethrow;
    }
  }
}
