import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/common/constants/constants_colors.dart';

import 'package:promic_app/src/app/modules/login/domain/entities/login.dart';
import 'package:promic_app/src/app/modules/login/domain/usecases/logar_usuario_uc.dart';
import 'package:promic_app/src/app/modules/login/domain/usecases/verificar_usuario_uc.dart';
import 'package:promic_app/src/app/modules/login/presenter/controllers/login_store.dart';

import '../../../common/widgets/text_form_field_login_custom_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LogarUsuarioUc logarUsuarioUc = Modular.get();
  final LoginStore store = Modular.get();
  final formKey = GlobalKey<FormState>();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();



  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
    Modular.get<VerificarUsuarioUc>().didChangeDependencies();
  });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: colorGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              //     color: colorGreen.withOpacity(0.05),
                              ),
                          child: Text(
                            'LOGIN',
                            style: const TextStyle(
                                fontSize: 23,
                                color: colorGreen,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormFieldLoginCustomWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo obrigatório, não pode ser vazio';
                            }
                            return null;
                          },
                          controller: controllerEmail,
                          title: 'Matrícula',
                        ),
                        TextFormFieldLoginCustomWidget(
                          obscureTex: store.visiblePassword.value,
                          suffixIcon: IconButton(
                            onPressed: () {
                              store.visiblePasswordChange();
                            },
                            icon: Icon(
                              store.visiblePassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo obrigatório, não pode ser vazio';
                            }
                            return null;
                          },
                          controller: controllerPassword,
                          title: 'Senha',
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
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                logarUsuarioUc(
                                  Login(
                                      matricula: controllerEmail.text,
                                      password: controllerPassword.text),
                                );
                              }
                            },
                            child: !store.isLoadingLogin
                                ? Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                                  )
                                : CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
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
                                Text('Não tem conta?'),
                                GestureDetector(
                                  onTap: () {
                                    Modular.to.pushNamed('/cadastro');
                                  },
                                  child: Text(
                                    'Cadastrar-se',
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
            ),
          ],
        ),
      ),
    );
  }
}
