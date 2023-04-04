import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/data/datasource/iniciacao_cientifica_datasource_impl.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/infra/repositories/iniciacao_cientifica_repository.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/infra/datasources/iniciacao_cientifica_datasource.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/infra/repository/iniciacao_cientifica_repository_impl.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/presenter/controllers/iniciacao_cientifica_store.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/presenter/usecases/delete_iniciacao_cientifica_uc.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/presenter/usecases/get_all_iniciacao_cientifica_uc.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/presenter/usecases/save_iniciacao_cientifica_uc.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/presenter/usecases/update_iniciacao_cientifica_uc.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/ui/feed_ic_page.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/ui/iniciacao_cientifica_page.dart';

class IniciacaoCientificaModule extends Module{
  @override
  
  List<Bind<Object>> get binds => [
    Bind.lazySingleton<IniciacaoCientificaDatasource>((i) => IniciacaoCientificaDatasourceImpl(), export: true),
    Bind.lazySingleton<IniciacaoCientificaRepository>((i) => IniciacaoCientificaRepositoryImpl(), export: true),
    Bind.lazySingleton<GetAllIniciacaoCientificaUc>((i) => GetAllIniciacaoCientificaImplUc(), export: true),
    Bind.lazySingleton<SaveIniciacaoCientificaUc>((i) => SaveIniciacaoCientificaImplUc(), export: true),
    Bind.lazySingleton<UpdateIniciacaoCientificaUc>((i) => UpdateIniciacaoCientificaImplUc(), export: true),
    Bind.lazySingleton<DeleteIniciacaoCientificaUc>((i) => DeleteIniciacaoCientificaImplUc(), export: true),
    Bind.lazySingleton((i) => IniciacaoCientificaStore()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const IniciacaoCientificaPage()),
    ChildRoute('/feedIc', child: ((context, args) => const FeedIcPage()))
  ];
}