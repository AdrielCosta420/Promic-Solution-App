import 'package:flutter/material.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/widgets/text_form_field_custom_widget.dart';

class DivulgarBolsasPage extends StatefulWidget {
  const DivulgarBolsasPage({Key? key}) : super(key: key);

  @override
  State<DivulgarBolsasPage> createState() => _DivulgarBolsasPageState();
}

class _DivulgarBolsasPageState extends State<DivulgarBolsasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xff19603d),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Image.asset('assets/images/promic.png'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Criar vaga para monitoria',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormFieldCustomWidget(
                            title: 'Título do Projeto',
                            hintDescription:
                                'Descreva qual a disciplina para monitoria'),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormFieldCustomWidget(
                            title: 'Orientador',
                            hintDescription: 'Insira o nome do orientador'),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormFieldCustomWidget(
                            title: 'Campus',
                            hintDescription: 'Insira o nome do Campus'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 10,
                      ),
                      onPressed: () {},
                      child: Text(
                        'CRIAR VAGA',
                        style: TextStyle(
                          color: Color(0xff19603d),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: const Color(0xff19603d),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
