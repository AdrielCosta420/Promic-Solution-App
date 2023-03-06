

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/usecases/save_bolsa_monitoria_uc.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/dto/bolsa_monitoria_dto.dart';
import '../widgets/text_form_field_custom_widget.dart';

class DivulgarBolsasPage extends StatefulWidget {
  const DivulgarBolsasPage({Key? key}) : super(key: key);

  @override
  State<DivulgarBolsasPage> createState() => _DivulgarBolsasPageState();
}

final List<String> campusList = [
  'SELECIONE UM CAMPUS',
  'Campus Aldeota - Fortaleza/CE',
  'Campus Carneiro Da Cunha - Fortaleza/CE',
  'Campus Conselheiro Estelita - Fortaleza/CE',
  'Campus Guilherme Rocha - Fortaleza/CE',
  'Campus Padre Ibiapina - Fortaleza/CE',
  'Campus Cascavel - CE',
  'Campus Maracanaú/CE',
];

class _DivulgarBolsasPageState extends State<DivulgarBolsasPage> {
  String dropdownValue = 'SELECIONE UM CAMPUS';

  final SaveBolsaMonitoriaUc uc = Modular.get();
  final TextEditingController controllerNomeOrientador =
      TextEditingController();
  final TextEditingController controllerCargoOrientador =
      TextEditingController();
  final TextEditingController controllerDescricaoBolsa =
      TextEditingController();
  final TextEditingController controllerCampusBolsa = TextEditingController();
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
                          controller: controllerNomeOrientador,
                            title: 'Orientador',
                            hintDescription: 'Insira o nome do orientador'),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormFieldCustomWidget(
                          controller: controllerCargoOrientador,
                            title: 'Cargo',
                            hintDescription: 'Ex: prof. de Ciências Sociais'),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormFieldCustomWidget(
                          controller: controllerDescricaoBolsa,
                            title: 'Descrição da bolsa',
                            hintDescription:
                                'Ex: preciso de um aluno para monitoria etc...'),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                          child: DropdownButton<String>(
                            
                            value: dropdownValue,
                            alignment: Alignment.topLeft,
                            dropdownColor: Color.fromARGB(220, 0, 0, 0),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                            iconSize: 30,
                            underline: SizedBox(),
                            items: campusList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 3.0,
                                  ),
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
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
                      onPressed: () {
                        uc(BolsaMonitoriaDto(
                          nomeOrientador: controllerNomeOrientador.text,
                          cargoOrientador: controllerCargoOrientador.text,
                          descricaoBolsa: controllerDescricaoBolsa.text,
                        ));
                      },
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
