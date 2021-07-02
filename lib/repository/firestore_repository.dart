import 'dart:async';
import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mega_cardapio/model/ErrorMessage.dart';
import 'package:mega_cardapio/model/Snack.dart';

class FirestoreRepository {
  static final FirestoreRepository instance = FirestoreRepository();

  late FirebaseApp _firebaseApp;
  late FirebaseFirestore _firebaseFirestore;
  late FirebaseAuth _firebaseAuth;
  late FirebaseStorage _firebaseStorage;

  void setFirebaseApp(FirebaseApp firebaseApp) {
    _firebaseApp = firebaseApp;
    _firebaseFirestore = FirebaseFirestore.instance;
    _firebaseAuth = FirebaseAuth.instance;
    _firebaseStorage = FirebaseStorage.instance;
  }

  bool isLoggedIn() {
    return _firebaseAuth.currentUser != null ? true : false;
  }

  void signOut() {
    _firebaseAuth.signOut();
  }

  FutureOr<dynamic> editSnack(Snack snack, String collection) async {
    try {
      await _firebaseFirestore
          .collection(collection)
          .doc(snack.id)
          .set(snack.toJson());
      return true;
    } catch (error) {
      return ErrorMessage(message: "Erro ao salvar item");
    }
  }

  Stream<QuerySnapshot> getSnacks(
      {required String collection, required bool isActive}) {
    return _firebaseFirestore
        .collection(collection)
        .where("active", isEqualTo: isActive)
        .snapshots();
  }

  FutureOr<dynamic> uploadImage(PickedFile image, String id) async {
    late UploadTask uploadTask;

    var reference = _firebaseStorage.ref().child("images/picture$id.jpeg");

    final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': image.path});

    try {
      uploadTask = reference.putFile(File(image.path), metadata);
      return await reference.getDownloadURL();
    } catch (error) {
      return ErrorMessage(message: "Erro ao salvar imagem");
    }
  }

  FutureOr<dynamic> login(String email, String senha) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return;
    } catch (error) {
      if (error is FirebaseAuthException) {
        late var errorMessage;
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Email inválido";
            break;
          case "user-not-found":
            errorMessage = "Usuário não encontrado";
            break;
          case "wrong-password":
            errorMessage = "Senha incorreta";
            break;
          default:
            errorMessage =
                "Um erro inesperado aconteceu, tente novamente mais tarde";
        }
        return ErrorMessage(message: errorMessage);
      }
    }
  }
}
