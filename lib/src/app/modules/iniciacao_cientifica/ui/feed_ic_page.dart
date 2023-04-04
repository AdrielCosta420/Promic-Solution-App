import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/entities/iniciacao_cientifica.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/presenter/controllers/iniciacao_cientifica_store.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/presenter/usecases/get_all_iniciacao_cientifica_uc.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/widgets/post_ic_custom_widget.dart';

import '../../../common/constants/constants_colors.dart';
import '../../home/ui/fab_teste_page.dart';
import '../../home/widgets/drawer_custom_widget.dart';

class FeedIcPage extends StatefulWidget {
  const FeedIcPage({Key? key}) : super(key: key);

  @override
  State<FeedIcPage> createState() => _FeedIcPageState();
}

class _FeedIcPageState extends State<FeedIcPage> {
  final GetAllIniciacaoCientificaImplUc getAll = Modular.get();

  IniciacaoCientificaStore store = Modular.get();
  List<IniciacaoCientifica> lista = [];

  Future<void> getAllIc() async {
    var list = await getAll.call();
  }

  @override
  void initState() {
    super.initState();
    store.isLoadingChange(false);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white12,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: AppBar(
              iconTheme: IconThemeData(color: Color(0xff19603d)),
              elevation: 0,

              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                  'assets/images/unifametro.png',
                  cacheHeight: 70,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors
                  .white, //const Color.fromARGB( 146, 0, 166, 91), Color.fromARGB(255, 254, 130, 5),
            ),
          ),
          drawer: DrawerCustomWidget(),
          body: store.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: colorGreen,
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(color: colorGreen, thickness: 0.1),
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    IniciacaoCientifica iniciacaoCientifica = lista[index];
                    return PostIcCustomWidget(
                      iniciacaoCientifica: iniciacaoCientifica,
                    );
                  },
                ),
          floatingActionButton: FabTestePage(),
        );
      },
    );
  }
}
