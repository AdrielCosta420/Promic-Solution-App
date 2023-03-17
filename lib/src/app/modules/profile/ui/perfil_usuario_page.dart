import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promic_app/src/app/common/constants/constants_colors.dart';
import 'package:promic_app/src/app/modules/cadastro/dto/cadastro_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:promic_app/src/app/modules/profile/widgets/row_perfil_custom_widget.dart';

class PerfilUsuarioPage extends StatefulWidget {
  final File? arquivo;
  const PerfilUsuarioPage({Key? key, this.arquivo}) : super(key: key);

  @override
  State<PerfilUsuarioPage> createState() => _PerfilUsuarioPageState();
}

Supabase supabase = Supabase.instance;
String? imageUrl;

class _PerfilUsuarioPageState extends State<PerfilUsuarioPage> {
  /* final picker = ImagePicker();

  buscarImageGaleria() async {
    final file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() => arquivo = File(file.path));
    }
  }*/

  Future<void> pickAndUploadImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final response = await supabase.client.storage
          .from('profiles-users/fotos')
          .uploadBinary(fileName, bytes, fileOptions: FileOptions(contentType: pickedFile.mimeType),);
      if (response.isNotEmpty) {
        setState(() {
          imageUrl = response;
        });
      }
    }
  }

  /* DESSA FORMA ELE N CONSEGUE LER O ARQUIVO
  final bytes = await pickedFile.readAsBytes();
final tempFile = File.fromRawPath(bytes);
final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
final response = await supabase.client.storage
    .from('profiles-users/fotos')
    .upload(fileName, tempFile);*/

  /* CONSIGO ENVIAR P STORAGE, MAS N CONSIGO VER A IMAGEM
  
   final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final path = await bytes.toSet();
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final response = await supabase.client.storage
          .from('profiles-users/fotos')
          .uploadBinary(fileName, bytes);
      if (response.isNotEmpty) {
        setState(() {
          imageUrl = response;
          */

  @override
  Widget build(BuildContext context) {
    final CadastroDto cadastroDto;
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
              RowPerfilCustomWidget(titulo: ''),
              RowPerfilCustomWidget(titulo: 'Email@email.com'),
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
