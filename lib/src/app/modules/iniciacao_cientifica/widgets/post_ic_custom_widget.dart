import 'package:flutter/material.dart';

class PostIcCustomWidget extends StatelessWidget {
  const PostIcCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO TIRAR ESSE SCAFOLD MOSTRAR SO PROFESSOR
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: 280,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5)),
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
                'Curso:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              const Divider(),
              Text(
                'Orientadores:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              const Divider(),
              Text(
                'Título do Projeto:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              const Divider(),
              Text(
                'Estudantes Aprovados:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
