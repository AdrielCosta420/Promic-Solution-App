import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/common/constants/constants_colors.dart';
import 'package:promic_app/src/app/modules/cadastro/dto/cadastro_dto.dart';
import 'package:promic_app/src/app/modules/cadastro/presenter/cadastrar_user_uc.dart';
import 'package:promic_app/src/app/modules/cadastro/presenter/controllers/cadastro_store.dart';
import 'package:string_validator/string_validator.dart' as validate;
import '../../../common/widgets/text_form_field_login_custom_widget.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final formKey = GlobalKey<FormState>();
  final CadastrarUserUc cadastrarUserUc = Modular.get();
  final TextEditingController controllerNome = TextEditingController();
  final TextEditingController controllerCpf = TextEditingController();
  final TextEditingController controllerDataNasc = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();
  final CadastroStore store = Modular.get();

  final maskCpf = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});

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
                        TextFormFieldLoginCustomWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo obrigatório, não pode ser vazio';
                            }
                            return null;
                          },
                          controller: controllerNome,
                          title: 'Nome',
                        ),
                        TextFormFieldLoginCustomWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo obrigatório, não pode ser vazio';
                            }
                            if (controllerCpf.text
                                    .replaceAll('.', '')
                                    .replaceAll('-', '')
                                    .length !=
                                11) {
                              return 'CPF inválido';
                            }
                            return null;
                          },
                          controller: controllerCpf,
                          title: 'CPF',
                          type: TextInputType.number,
                          inputFormatters: [maskCpf],
                          hintText: '000.000.000-00',
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: DateTimePicker(
                            //  initialValue: DateTime.now().toString(),
                            enableInteractiveSelection: true,
                            enableSuggestions: true,
                            cursorColor: colorGreen,
                            firstDate: DateTime(1930),
                            lastDate: DateTime(2100),
                            dateMask: 'd MMM yyyy',
                            icon: Icon(Icons.date_range_outlined,
                                color: colorGreen),
                            calendarTitle: 'Data de Nascimento',
                            timeLabelText: 'Data de Nascimento',
                            controller: controllerDataNasc,
                            dateHintText: 'Data de Nascimento',
                            onChanged: (value) {},
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Campo inválido, preencha corretamente';
                              }
                              return null;
                            },

                            decoration: InputDecoration(
                              label: Text(
                                'Data de Nascimento',
                                style: TextStyle(color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: colorGreen,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: colorGreen,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: colorGreen,
                                ),
                              ),
                            ),
                          ),
                        ),

                        /* TextFormFieldLoginCustomWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo inválido, preencha corretamente';
                            }
                            return null;
                          },
                          controller: controllerDataNasc,
                          title: 'Data de Nascimento',
                          type: TextInputType.datetime,
                          hintText: '00/00/0000',
                        ),*/
                        TextFormFieldLoginCustomWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo obrigatório, não pode ser vazio';
                            }
                            return null;
                          },
                          controller: controllerEmail,
                          title: 'Email Institucional',
                          type: TextInputType.emailAddress,
                        ),
                        TextFormFieldLoginCustomWidget(
                          obscureTex: store.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo obrigatório, não pode ser vazio';
                            }
                            return null;
                          },
                          controller: controllerSenha,
                          title: 'Senha',
                          suffixIcon: Icon(
                            Icons.visibility,
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
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                cadastrarUserUc(
                                  CadastroDto(
                                    nome: controllerNome.text,
                                    cpf: controllerCpf.text,
                                    dataNasc: controllerDataNasc.text,
                                    cep: controllerSenha.text,
                                    emailInstitucional: controllerEmail.text,
                                    password: controllerSenha.text,
                                  ),
                                );
                              }
                            },
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
