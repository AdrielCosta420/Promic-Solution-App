import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/ui/iniciacao_cientifica_page.dart';
import 'package:promic_app/src/app/modules/profile/ui/perfil_usuario_page.dart';

import '../../../common/constants/constants_colors.dart';
import '../../login/domain/usecases/loggof_usuario_uc.dart';
import '../../profile/ui/profile_user_page.dart';
import 'opcao_drawer_custom_widget.dart';

class DrawerCustomWidget extends StatelessWidget {
  final LoggofUsuarioImplUc loggofUsuarioImplUc = Modular.get();

  DrawerCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Container(
                width: 230,
                height: 120,
                color: colorGreen,
                child: Image.asset('assets/images/logouni.png'),
              ),
              const Divider(),
              const SizedBox(
                height: 30,
              ),

              OpcaoDrawerCustomWidget(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const IniciacaoCientificaPage())),
                  title: 'Iniciação Científica'),
              OpcaoDrawerCustomWidget(
                  onTap: () {
                    Modular.to.pushNamed('/bolsa/');
                  },
                  title: 'Bolsa Monitoria'),
              OpcaoDrawerCustomWidget(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PerfilUsuarioPage(),
                      )),
                  title: 'Configurações'),
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
    );
  }
}
