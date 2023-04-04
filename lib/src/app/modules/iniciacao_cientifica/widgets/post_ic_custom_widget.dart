import 'package:flutter/material.dart';
import 'package:promic_app/src/app/modules/iniciacao_cientifica/domain/entities/iniciacao_cientifica.dart';

class PostIcCustomWidget extends StatelessWidget {
  const PostIcCustomWidget({Key? key, required this.iniciacaoCientifica}) : super(key: key);

  final IniciacaoCientifica iniciacaoCientifica;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 280,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              width: 200,
              color: Color.fromARGB(255, 146, 228, 188),
              child: Center(
                  child: Text(
                'INICIAÇÃO CIENTÍFICA',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              )),
            ),
          ),
          Text(
            iniciacaoCientifica.cursoIc,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          const Divider(),
          Text(
            iniciacaoCientifica.orientadorIc,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          const Divider(),
          Text(
            iniciacaoCientifica.tituloIc,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          const Divider(),
          Text(
            iniciacaoCientifica.alunosAprovadosIc,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
