import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../common/constants/constants_colors.dart';
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

  List<BolsaMonitoriaDto> lista = [];
  bool isLoading = true;

  Future<void> getAllBolsas() async {
    var list = await getlAll.call();

    setState(() {
      lista = list;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllBolsas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          iconTheme: IconThemeData(color: Color(0xff19603d)),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
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
          color: Color.fromARGB(43, 80, 77, 73),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 110, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OpcaoDrawerCustomWidget(
                  onTap: () {}, title: 'Solicitar Bolsa de Mentoria'),
              const SizedBox(
                height: 15,
              ),
              Container(
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
              ),
              const SizedBox(
                height: 15,
              ),
              OpcaoDrawerCustomWidget(
                  onTap: () {}, title: 'Acompanhar Solicitação'),
              const SizedBox(
                height: 15,
              ),
              Container(
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
              ),
              const SizedBox(
                height: 15,
              ),
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
              const SizedBox(
                height: 15,
              ),
              Container(
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
              ),
              const SizedBox(
                height: 15,
              ),
              OpcaoDrawerCustomWidget(
                  onTap: () {
                    Modular.to.pushNamed('/bolsa/');
                  },
                  title: 'Divulgar Bolsas'),
            ],
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(color: colorGreen, thickness: 0.8),
              itemCount: lista.length,
              itemBuilder: (context, index) {
                BolsaMonitoriaDto  bolsa = lista[index];
                return PostVagaBolsaCustomWidget(bolsa: bolsa);
              },
            ),
    );
  }
}
