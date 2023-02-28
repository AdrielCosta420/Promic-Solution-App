import 'package:flutter_modular/flutter_modular.dart';
import 'data/cadastro_datasource_impl.dart';
import 'domain/infra/repositories/cadastro_repository.dart';
import 'infra/datasource/cadastro_datasource.dart';
import 'infra/repositories/cadastro_repository_impl.dart';
import 'presenter/cadastrar_user_uc.dart';

import 'ui/cadastro_page.dart';

class CadastroModule extends Module{
  @override
  
  List<Bind<Object>> get binds => [
    Bind.lazySingleton<CadastroDatasource>((i) => CadastroDatasourceImpl()),
    Bind.lazySingleton<CadastroRepository>((i) => CadastroRepositoryImpl()),
    Bind.lazySingleton<CadastrarUserUc>((i) => CadastrarUserImplUc())
  ];

  @override
  
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const CadastroPage())
  ];
}