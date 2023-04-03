import 'package:flutter/material.dart';
import 'package:promic_app/src/app/common/constants/constants_colors.dart';
import 'package:promic_app/src/app/common/widgets/text_form_field_login_custom_widget.dart';

import '../widgets/post_ic_custom_widget.dart';

class IniciacaoCientificaPage extends StatefulWidget {
  const IniciacaoCientificaPage({Key? key}) : super(key: key);

  @override
  State<IniciacaoCientificaPage> createState() =>
      _IniciacaoCientificaPageState();
}

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
            child: Column(
              children: [
                Image.asset('assets/images/logouni.png'),
                TextFormFieldLoginCustomWidget(
                  title: 'Curso',
                ),
                TextFormFieldLoginCustomWidget(
                  title: 'Título do Projeto',
                ),
                TextFormFieldLoginCustomWidget(
                  title: 'Orientadores',
                ),
                TextFormFieldLoginCustomWidget(
                  title: 'Estudantes Aprovados',
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
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const PostIcCustomWidget())),
                    child: Text(
                      'POSTAR',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
