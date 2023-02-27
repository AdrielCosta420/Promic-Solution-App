import 'package:flutter/material.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/ui/divulgar_bolsas_page.dart';
import '../delegates/fab_delegate_vertical.dart';
import '../widgets/opcao_drawer_custom_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(
              146, 0, 166, 91), //Color.fromARGB(255, 254, 130, 5),
          title: const Text('Unifametro'),
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
                        Colors.blue.withOpacity(0.2),
                        Colors.blue.withOpacity(0.4),
                        Colors.blue.withOpacity(0.6),
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
                        Colors.blue.withOpacity(0.1),
                        Colors.blue.withOpacity(0.3),
                        Colors.blue.withOpacity(0.6),
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
                        Colors.blue.withOpacity(0.1),
                        Colors.blue.withOpacity(0.3),
                        Colors.blue.withOpacity(0.6),
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
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DivulgarBolsasPage(),
                      ));
                    },
                    title: 'Divulgar Bolsas'),
              ],
            ),
          ),
        ),
        body: Container());
  }
}
