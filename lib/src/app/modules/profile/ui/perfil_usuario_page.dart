import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promic_app/src/app/common/constants/constants_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../widgets/row_perfil_custom_widget.dart';

class PerfilUsuarioPage extends StatefulWidget {
  const PerfilUsuarioPage({Key? key}) : super(key: key);

  @override
  State<PerfilUsuarioPage> createState() => _PerfilUsuarioPageState();
}

Supabase supabase = Supabase.instance;
String? imageUrl;

class _PerfilUsuarioPageState extends State<PerfilUsuarioPage> {
  Future<void> pickAndUploadImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final response = await supabase.client.storage
          .from('profiles-users')
          .uploadBinary(fileName, bytes);
      if (response.isNotEmpty) {
        setState(() {
          imageUrl = response;
        });
      }
    }
  }

  /* buscarUsuario() async {
    final uuid = supabase.client.auth.currentUser?.id;

    if (uuid != null) {
      var table = await supabase.client.from('usuario').
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conta'),
        backgroundColor: colorGreen,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => pickAndUploadImage(),
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(48), // Image radius
                      child: CircleAvatar(
                        backgroundImage:
                            imageUrl != null ? NetworkImage(imageUrl!) : null,
                        backgroundColor: Colors.grey.shade200,
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: colorGreen,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              RowPerfilCustomWidget(titulo: 'nome de nome nome'),
              RowPerfilCustomWidget(titulo: 'email@email.com'),
              RowPerfilCustomWidget(titulo: 'Data de Nascimento:'),
              //   RowPerfilCustomWidget(titulo: 'disciplina'),
              //   RowPerfilCustomWidget(titulo: 'matriculado: ads'),
            ],
          ),
        ),
      ),
    );
  }
}
