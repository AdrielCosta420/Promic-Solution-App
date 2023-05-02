import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/common/constants/constants_colors.dart';
import 'package:promic_app/src/app/modules/home/delegates/fab_delegate_vertical.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/ui/feed_ic_page.dart';
import 'package:promic_app/src/app/modules/profile/ui/perfil_usuario_page.dart';

import '../../iniciacao_cientifica/ui/iniciacao_cientifica_page.dart';

class FabTestePage extends StatefulWidget {
  const FabTestePage({Key? key}) : super(key: key);

  @override
  State<FabTestePage> createState() => _FabTestePageState();
}

class _FabTestePageState extends State<FabTestePage>
    with SingleTickerProviderStateMixin {
  // final actionButtonColor = Colors.tealAccent.shade100;

  late AnimationController animation;
  final menuIsOpen = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  toggleMenu() {
    menuIsOpen.value ? animation.reverse() : animation.forward();
    menuIsOpen.value = !menuIsOpen.value;
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
        clipBehavior: Clip.none,
        children: [
          FloatingActionButton(
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: animation,
              color: Colors.white,
            ),
            onPressed: () => toggleMenu(),
            backgroundColor: colorGreen,
          ),
          FloatingActionButton(
            onPressed: () => Modular.to.pushNamed('/bolsa/'),
            child: Icon(
              Icons.assignment_add,
              color: Colors.white,
            ),
            backgroundColor: colorGreen.withOpacity(0.8),
          ),
          FloatingActionButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const IniciacaoCientificaPage())),
            child: Icon(
              Icons.note_alt_outlined,
              color: Colors.white,
              size: 27,
            ),
            backgroundColor: colorGreen.withOpacity(0.8),
          ),
          FloatingActionButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PerfilUsuarioPage())),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
            backgroundColor: colorGreen.withOpacity(0.8),
          ),
        ],
        delegate: FabDelegateVertical(animation: animation));
  }
}
