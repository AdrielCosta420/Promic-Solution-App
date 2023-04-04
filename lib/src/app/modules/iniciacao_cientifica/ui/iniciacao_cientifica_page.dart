import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/common/constants/constants_colors.dart';
import 'package:promic_app/src/app/common/widgets/text_form_field_login_custom_widget.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/entities/iniciacao_cientifica.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/presenter/usecases/save_iniciacao_cientifica_uc.dart';

import '../widgets/post_ic_custom_widget.dart';

class IniciacaoCientificaPage extends StatefulWidget {
  const IniciacaoCientificaPage({Key? key}) : super(key: key);

  @override
  State<IniciacaoCientificaPage> createState() =>
      _IniciacaoCientificaPageState();
}

SaveIniciacaoCientificaUc uc = Modular.get();
final formKey = GlobalKey<FormState>();
TextEditingController controllerCurso = TextEditingController();
TextEditingController controllerTitulo = TextEditingController();
TextEditingController controllerOrientador = TextEditingController();
TextEditingController controllerEstudantes = TextEditingController();

class _IniciacaoCientificaPageState extends State<IniciacaoCientificaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 214, 243, 229),
        centerTitle: true,
        title: const Text(
          'INICIAÇÃO CIENTÍFICA',
          style: TextStyle(color: colorGreen),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: colorGreen,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset('assets/images/logouni.png'),
                  TextFormFieldLoginCustomWidget(
                    title: 'Curso',
                    controller: controllerCurso,
                  ),
                  TextFormFieldLoginCustomWidget(
                    title: 'Título do Projeto',
                    controller: controllerTitulo,
                  ),
                  TextFormFieldLoginCustomWidget(
                    title: 'Orientadores',
                    controller: controllerOrientador,
                  ),
                  TextFormFieldLoginCustomWidget(
                    title: 'Estudantes Aprovados',
                    controller: controllerEstudantes,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 320,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: colorGreen,
                      ),
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          uc.call(
                            IniciacaoCientifica(
                                cursoIc: controllerCurso.text,
                                tituloIc: controllerTitulo.text,
                                orientadorIc: controllerOrientador.text,
                                alunosAprovadosIc: controllerEstudantes.text),
                          );
                        }
                        Modular.to.pushNamed('/ic/');
                      },
                      child: Text(
                        'POSTAR',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
