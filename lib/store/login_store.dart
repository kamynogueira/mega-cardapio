import 'dart:async';

import 'package:mega_cardapio/model/ErrorMessage.dart';
import 'package:mega_cardapio/repository/firestore_repository.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String email = "";

  @action
  void setEmail(value) => email = value;

  @action
  String? verifyEmail() {
    if (email.isEmpty) return "Campo Obrigatório";
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) return "Email Inválido";

    return null;
  }

  @observable
  String senha = "";

  @action
  void setSenha(value) => senha = value;

  @action
  String? verifySenha() {
    if (senha.length < 6) return "Senha muito curta!";
    return null;
  }

  @observable
  String? errorMessage;

  @observable
  String? emailMessage;

  @observable
  String? passwordMessage;

  @observable
  bool loading = false;

  @observable
  bool success = false;

  @action
  Future<void> login() async {
    loading = true;
    var response = await FirestoreRepository.instance.login(email, senha);

    if (response is ErrorMessage) {
      errorMessage = response.message;
    } else {
      success = true;
    }
    loading = false;
  }
}
