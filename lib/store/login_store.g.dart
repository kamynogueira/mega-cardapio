// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$emailAtom = Atom(name: '_LoginStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_LoginStoreBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_LoginStoreBase.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$emailMessageAtom = Atom(name: '_LoginStoreBase.emailMessage');

  @override
  String? get emailMessage {
    _$emailMessageAtom.reportRead();
    return super.emailMessage;
  }

  @override
  set emailMessage(String? value) {
    _$emailMessageAtom.reportWrite(value, super.emailMessage, () {
      super.emailMessage = value;
    });
  }

  final _$passwordMessageAtom = Atom(name: '_LoginStoreBase.passwordMessage');

  @override
  String? get passwordMessage {
    _$passwordMessageAtom.reportRead();
    return super.passwordMessage;
  }

  @override
  set passwordMessage(String? value) {
    _$passwordMessageAtom.reportWrite(value, super.passwordMessage, () {
      super.passwordMessage = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$successAtom = Atom(name: '_LoginStoreBase.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginStoreBase.login');

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void setEmail(dynamic value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? verifyEmail() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.verifyEmail');
    try {
      return super.verifyEmail();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(dynamic value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? verifySenha() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.verifySenha');
    try {
      return super.verifySenha();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha},
errorMessage: ${errorMessage},
emailMessage: ${emailMessage},
passwordMessage: ${passwordMessage},
loading: ${loading},
success: ${success}
    ''';
  }
}
