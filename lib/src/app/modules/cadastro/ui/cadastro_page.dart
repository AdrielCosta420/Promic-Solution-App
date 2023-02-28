import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/common/constants/constants_colors.dart';

import '../../login/widgets/text_form_field_login_custom_widget.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: colorGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/logouni.png'),
            ),
            Container(
              color: colorGreen.withOpacity(0.05),
              child: Observer(
                builder: (context) {
                  return Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          padding: const EdgeInsets.all(12),
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                              //     color: colorGreen.withOpacity(0.05),
                              ),
                          child: Text(
                            'CADASTRO',
                            style: const TextStyle(
                                fontSize: 23,
                                color: colorGreen,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormFieldLoginCustomWidget(
                            title: 'Nome',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormFieldLoginCustomWidget(
                            title: 'CPF',
                            type: TextInputType.number,
                            hintText: '000.000.000-00',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormFieldLoginCustomWidget(
                            title: 'Data de Nascimento',
                            type: TextInputType.datetime,
                            hintText: '00/00/0000',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormFieldLoginCustomWidget(
                            title: 'Email Institucional',
                            type: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormFieldLoginCustomWidget(
                            title: 'Senha',
                            suffixIcon: Icon(
                              Icons.visibility,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 360,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorGreen,
                              elevation: 3,
                            ),
                            onPressed: () {},
                            child: Text(
                              'CADASTRO',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Esqueci minha senha\n  '),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Já tem conta?'),
                                GestureDetector(
                                  onTap: () {
                                    Modular.to.pushNamed('/');
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: colorGreen,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
