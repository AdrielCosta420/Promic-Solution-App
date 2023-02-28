import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/login/data/datasource/login_datasource_impl.dart';
import 'package:promic_app/src/app/modules/login/domain/infra/repositories/login_repository.dart';
import 'package:promic_app/src/app/modules/login/domain/usecases/logar_usuario_uc.dart';
import 'package:promic_app/src/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:promic_app/src/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:promic_app/src/app/modules/login/ui/login_page.dart';

class LoginModule extends Module{
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
    Bind.lazySingleton<LoginDatasource>((i) => LoginDatasourceImpl()),
    Bind.lazySingleton<LoginRepository>((i) => LoginRepositoryImpl()),
    Bind.lazySingleton<LogarUsuarioUc>((i) => LogarUsuarioImplUc()),
  ];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const LoginPage()),
  ];
}