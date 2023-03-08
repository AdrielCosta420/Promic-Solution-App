import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/home/controllers/home_store.dart';
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
  final LoggofUsuarioImplUc loggofUsuarioImplUc = Modular.get();
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
          drawer: Container(
            width: 270,
            decoration: const BoxDecoration(
              color: Colors.white,
              //Color.fromARGB(255, 25, 96, 60),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/logpromic.png'),
                    const SizedBox(
                      height: 30,
                    ),
                    OpcaoDrawerCustomWidget(
                        onTap: () {}, title: 'Solicitar Bolsa de Mentoria'),
                    // const SizedBox(height: 23),
                    /* Container(
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff19603d).withOpacity(0.2),
                            Color(0xff19603d).withOpacity(0.4),
                            Color(0xff19603d).withOpacity(0.6),
                          ],
                          stops: const [0.0, 0.5, 1.0],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: const Divider(
                        color: Colors.transparent,
                        height: 2,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ),*/

                    OpcaoDrawerCustomWidget(
                        onTap: () {}, title: 'Acompanhar Solicitação'),
                    // const SizedBox(height: 23),
                    /* Container(
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff19603d).withOpacity(0.1),
                            Color(0xff19603d).withOpacity(0.3),
                            Color(0xff19603d).withOpacity(0.6),
                          ],
                          stops: const [0.0, 0.5, 1.0],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                        ),
                      ),
                      child: const Divider(
                        color: Colors.transparent,
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ),*/

                    OpcaoDrawerCustomWidget(
                        onTap: () {}, title: 'Iniciação Científica'),
                    /*  Flow(
                        clipBehavior: Clip.none,
                        delegate: FabDelegateVertical(),
                        children: [
                          FloatingActionButton(
                              onPressed: () {}, child: const Icon(Icons.settings)),
                          FloatingActionButton(
                              onPressed: () {},
                              child: const Icon(Icons.person_4_outlined)),
                          FloatingActionButton(
                              onPressed: () {}, child: const Icon(Icons.logout)),
                        ],
                      ),*/
                    // const SizedBox(height: 23),
                    /*Container(
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff19603d).withOpacity(0.1),
                            Color(0xff19603d).withOpacity(0.3),
                            Color(0xff19603d).withOpacity(0.6),
                          ],
                          stops: const [0.0, 0.5, 1.0],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: const Divider(
                        color: Colors.transparent,
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ),*/

                    OpcaoDrawerCustomWidget(
                        onTap: () {
                          Modular.to.pushNamed('/bolsa/');
                        },
                        title: 'Divulgar Bolsas'),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        loggofUsuarioImplUc.loggof();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'SAIR',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Icon(
                              Icons.logout_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: colorGreen.withOpacity(0.9),
                        ),
                      ),
                    )
                    // OpcaoDrawerCustomWidget(onTap: () {}, title: 'Logout'),
                  ],
                ),
              ),
            ),
          ),
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
        );
      },
    );
  }
}
