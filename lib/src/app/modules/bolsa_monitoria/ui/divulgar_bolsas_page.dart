import 'package:flutter/material.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/widgets/text_form_field_custom_widget.dart';

class DivulgarBolsasPage extends StatefulWidget {
  const DivulgarBolsasPage({Key? key}) : super(key: key);

  @override
  State<DivulgarBolsasPage> createState() => _DivulgarBolsasPageState();
}

final List<String> campusList = [
  'Campus Aldeota - Fortaleza/CE',
  'Campus Carneiro Da Cunha - Fortaleza/CE',
  'Campus Conselheiro Estelita - Fortaleza/CE',
  'Campus Guilherme Rocha - Fortaleza/CE',
  'Campus Padre Ibiapina - Fortaleza/CE',
  'Campus Cascavel - CE',
  'Campus Maracanaú/CE',
];

class _DivulgarBolsasPageState extends State<DivulgarBolsasPage> {
  String dropdownValue = campusList.first;

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
                        DropdownButton<String>(
                          value: dropdownValue,
                          borderRadius: BorderRadius.circular(20),
                          alignment: Alignment.topLeft,
                          dropdownColor: Colors.white,
                          hint: Text(
                            'Selecione o Campus',
                            style: TextStyle(
                              color: Colors.white38,
                            ),
                          ),
                          items: campusList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                        ),
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
