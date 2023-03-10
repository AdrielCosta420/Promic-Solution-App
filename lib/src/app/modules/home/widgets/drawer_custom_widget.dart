import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
              OpcaoDrawerCustomWidget(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PerfilUsuarioPage(),
                      )),
                  title: 'Profile'),
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
