import 'dart:io';
import 'dart:typed_data';

import 'package:asuka/asuka.dart' as asuka;
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

Uint8List? foto;
bool informacoesAlteradas = false;

class _PerfilUsuarioPageState extends State<PerfilUsuarioPage> {

  Future<void> pickAndUploadImage() async {
    String userID = supabase.client.auth.currentUser!.id;
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();

      setState(() {
        foto = bytes;
        informacoesAlteradas = true;
      });

      final fileName = '$userID-${DateTime.now().millisecondsSinceEpoch}.jpg';
      final response = await supabase.client.storage
          .from('profiles-users/fotos')
          .uploadBinary(
            fileName,
            bytes,
            fileOptions: FileOptions(contentType: pickedFile.mimeType),
          );
      await supabase.client
          .from("usuario")
          .update({'foto': response}).filter("uuid", "eq", userID)
          .then((_) => asuka.AsukaSnackbar.success("Foto Atualizada").show())
          .onError(
            (error, stackTrace) =>
                asuka.AsukaSnackbar.alert("Erro ao atualizar Foto"),
          );
    }
  }

  

  Future<void> recuperarFoto() async {
    final usuario =
        await supabase.client.from("usuario").select("foto").gte("id", "value");

    //TODO
    final response =
        await supabase.client.storage.from('profiles-users/fotos').download("");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CadastroDto cadastroDto;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conta'),
        backgroundColor: colorGreen,
      ),
      floatingActionButton: informacoesAlteradas
          ? FloatingActionButton(
              onPressed: () {
                print(supabase.client.auth.currentUser!.id);
                setState(() {
                  informacoesAlteradas = false;
                });
              },
              child: Icon(Icons.save),
            )
          : null,
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
                        backgroundImage: foto != null
                            ? MemoryImage(foto!)
                            : Image.asset("assets/images/avatar1.jpg").image,
                        backgroundColor: Colors.grey.shade200,
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
