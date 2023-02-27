import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:promic_app/src/app/common/constants/constants_firebase.dart';
import 'package:promic_app/src/app/modules/cadastro/domain/entities/cadastro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:promic_app/src/app/modules/cadastro/domain/errors/cadastro_errors.dart';
import 'package:promic_app/src/app/modules/cadastro/infra/datasource/cadastro_datasource.dart';

class CadastroDatasourceImpl implements CadastroDatasource {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<UserCredential> cadastro(Cadastro cadastro) async {
    try {
      var userCredential = await auth.createUserWithEmailAndPassword(
          email: cadastro.email, password: cadastro.password);

      if (userCredential.user != null) {
        await firestore
            .collection(collectionUser)
            .doc(userCredential.user!.uid)
            .set(cadastro.toMap());
      }
      return userCredential;
    } on FirebaseAuthException catch (_) {
      throw CadastroErrors(errorMessage: 'Erro ao fazer Cadastro.');
    } on Exception catch (_) {
      throw CadastroErrors(errorMessage: 'Erro desconhecido ao fazer Cadastro');
    }
  }
}
