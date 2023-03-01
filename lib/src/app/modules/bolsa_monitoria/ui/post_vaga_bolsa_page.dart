import 'package:flutter/material.dart';
import 'package:promic_app/src/app/common/constants/constants_colors.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/entities/bolsa_monitoria.dart';

class PostVagaBolsaPage extends StatelessWidget {
  const PostVagaBolsaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BolsaMonitoria bolsaMonitoria = BolsaMonitoria(
        orientador: 'Adriel Silva Costa',
        titulo:
            'Preciso de 1 aluno para ser monitor da disciplina Fundamentos de Banco de Dados.',
        cargo: 'Professor de Fundamentos de Banco de Dados');

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 60.0,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bolsaMonitoria.orientador,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          bolsaMonitoria.cargo ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(bolsaMonitoria.titulo),
              ),
              SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorGreen,
                    elevation: 5,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Candidate-se',
                    style: TextStyle(
                        letterSpacing: 0.2, fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
