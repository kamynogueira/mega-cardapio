// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MenuStore on _MenuStoreBase, Store {
  final _$snackListAtom = Atom(name: '_MenuStoreBase.snackList');

  @override
  List<Snack> get snackList {
    _$snackListAtom.reportRead();
    return super.snackList;
  }

  @override
  set snackList(List<Snack> value) {
    _$snackListAtom.reportWrite(value, super.snackList, () {
      super.snackList = value;
    });
  }

  final _$loadingAtom = Atom(name: '_MenuStoreBase.loading');

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

  final _$_MenuStoreBaseActionController =
      ActionController(name: '_MenuStoreBase');

  @override
  Stream<QuerySnapshot<Object?>> getSnacks(
      {required String collection, bool isActive = true}) {
    final _$actionInfo = _$_MenuStoreBaseActionController.startAction(
        name: '_MenuStoreBase.getSnacks');
    try {
      return super.getSnacks(collection: collection, isActive: isActive);
    } finally {
      _$_MenuStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
snackList: ${snackList},
loading: ${loading}
    ''';
  }
}
