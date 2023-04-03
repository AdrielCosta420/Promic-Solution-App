// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:promic_app/src/app/common/constants/constants_colors.dart';
import 'package:promic_app/src/app/modules/bolsa_monitoria/domain/entities/bolsa_monitoria.dart';

import '../dto/bolsa_monitoria_dto.dart';

class PostVagaBolsaCustomWidget extends StatelessWidget {
  const PostVagaBolsaCustomWidget({
    Key? key,
    required this.bolsa,
  }) : super(key: key);

  final BolsaMonitoriaDto bolsa;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(7),
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
                  child: ClipOval(
                    child: Image.asset('assets/images/filelink.png'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bolsa.nomeOrientador ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      bolsa.cargoOrientador ?? '',
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
            child: Text(bolsa.descricaoBolsa ?? ""),
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
                style:
                    TextStyle(letterSpacing: 0.2, fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}
