import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/cadastro/presenter/controllers/cadastro_store.dart';
import 'data/datasource/cadastro_datasource_impl.dart';
import 'domain/infra/repositories/cadastro_repository.dart';
import 'infra/datasource/cadastro_datasource.dart';
import 'infra/repositories/cadastro_repository_impl.dart';
import 'presenter/cadastrar_user_uc.dart';

import 'ui/cadastro_page.dart';

class CadastroModule extends Module{
  @override
  
  List<Bind> get binds => [
    Bind.lazySingleton<CadastroDatasource>((i) => CadastroDatasourceImpl()),
    Bind.lazySingleton<CadastroRepository>((i) => CadastroRepositoryImpl()),
    Bind.lazySingleton<CadastrarUserUc>((i) => CadastrarUserImplUc()),
    Bind.lazySingleton((i) => CadastroStore()),
  ];

  @override
  
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const CadastroPage())
  ];
}