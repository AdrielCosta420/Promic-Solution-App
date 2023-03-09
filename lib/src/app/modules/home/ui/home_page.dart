import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/home/controllers/home_store.dart';
import 'package:promic_app/src/app/modules/home/ui/fab_teste_page.dart';
import 'package:promic_app/src/app/modules/home/ui/profile_user_page.dart';
import 'package:promic_app/src/app/modules/home/widgets/drawer_custom_widget.dart';
import 'package:promic_app/src/app/modules/login/domain/usecases/loggof_usuario_uc.dart';
import '../../../common/constants/constants_colors.dart';
import '../../bolsa_monitoria/domain/usecases/delete_bolsa_monitoria_uc.dart';
import '../../bolsa_monitoria/domain/usecases/get_all_bolsa_monitoria_uc.dart';
import '../../bolsa_monitoria/dto/bolsa_monitoria_dto.dart';
import '../../bolsa_monitoria/widgets/post_vaga_bolsa_custom_widget.dart';
import '../widgets/opcao_drawer_custom_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetAllBolsaMonitoriaImplUc getlAll = Modular.get();

  HomeStore store = Modular.get();
  List<BolsaMonitoriaDto> lista = [];

  //bool isLoading = true;

  Future<void> getAllBolsas() async {
    var list = await getlAll.call();

    setState(() {
      lista = list;
      store.isLoadingHomeChange(false);
    });
  }

  @override
  void initState() {
    super.initState();
    getAllBolsas();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: AppBar(
              iconTheme: IconThemeData(color: Color(0xff19603d)),
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    getlAll.call();
                  },
                  icon: Icon(
                    Icons.refresh,
                    size: 30,
                  ),
                ),
              ],
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
          body: store.isLoadingHome
              ? Center(
                  child: CircularProgressIndicator(
                    color: colorGreen,
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(color: colorGreen, thickness: 0.8),
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    BolsaMonitoriaDto bolsa = lista[index];
                    return PostVagaBolsaCustomWidget(bolsa: bolsa);
                  },
                ),
          floatingActionButton: FabTestePage(),
        );
      },
    );
  }
}
