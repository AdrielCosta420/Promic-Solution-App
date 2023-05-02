import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../domain/entities/iniciacao_cientifica.dart';
import 'row_custom_widget_ic.dart';

class PostIcCustomWidget extends StatelessWidget {
  const PostIcCustomWidget({Key? key, required this.iniciacaoCientifica})
      : super(key: key);

  final IniciacaoCientifica iniciacaoCientifica;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
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
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 146, 228, 188),
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 9,
                    child: Center(
                      child: Text(
                        'INICIAÇÃO CIENTÍFICA',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: PopupMenuButton(
                      position: PopupMenuPosition.under,
                      color: Color.fromARGB(216, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      icon: Icon(
                        Icons.ads_click,
                        color: Colors.grey.shade700,
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: TextButton.icon(
                            onPressed: () async {
                              Supabase supabase = Supabase.instance;

                              await supabase.client
                                  .from('ic')
                                  .delete()
                                  .eq('id', iniciacaoCientifica.id);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            label: Text(
                              'Deletar',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                            label: Text('Editar'),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          RowCustomWidgetIc(
              title: 'Curso', response: iniciacaoCientifica.cursoIc),
          const Divider(),
          RowCustomWidgetIc(
              title: 'Orientadores',
              response: iniciacaoCientifica.orientadorIc),
          const Divider(),
          RowCustomWidgetIc(
              title: 'Título', response: iniciacaoCientifica.tituloIc),
          const Divider(),
          RowCustomWidgetIc(
              title: 'Alunos Aprovados',
              response: iniciacaoCientifica.alunosAprovadosIc),
        ],
      ),
    );
  }
}
