// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditProductStore on _EditProductStoreBase, Store {
  final _$idAtom = Atom(name: '_EditProductStoreBase.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$collectionAtom = Atom(name: '_EditProductStoreBase.collection');

  @override
  String get collection {
    _$collectionAtom.reportRead();
    return super.collection;
  }

  @override
  set collection(String value) {
    _$collectionAtom.reportWrite(value, super.collection, () {
      super.collection = value;
    });
  }

  final _$nameAtom = Atom(name: '_EditProductStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_EditProductStoreBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$imageUrlAtom = Atom(name: '_EditProductStoreBase.imageUrl');

  @override
  String get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  final _$loadingImageAtom = Atom(name: '_EditProductStoreBase.loadingImage');

  @override
  bool get loadingImage {
    _$loadingImageAtom.reportRead();
    return super.loadingImage;
  }

  @override
  set loadingImage(bool value) {
    _$loadingImageAtom.reportWrite(value, super.loadingImage, () {
      super.loadingImage = value;
    });
  }

  final _$priceAtom = Atom(name: '_EditProductStoreBase.price');

  @override
  String get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_EditProductStoreBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$loadingAtom = Atom(name: '_EditProductStoreBase.loading');

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

  final _$uploadImageAsyncAction =
      AsyncAction('_EditProductStoreBase.uploadImage');

  @override
  Future<void> uploadImage(PickedFile file) {
    return _$uploadImageAsyncAction.run(() => super.uploadImage(file));
  }

  final _$editSnackAsyncAction = AsyncAction('_EditProductStoreBase.editSnack');

  @override
  Future<void> editSnack() {
    return _$editSnackAsyncAction.run(() => super.editSnack());
  }

  final _$_EditProductStoreBaseActionController =
      ActionController(name: '_EditProductStoreBase');

  @override
  void setName(dynamic value) {
    final _$actionInfo = _$_EditProductStoreBaseActionController.startAction(
        name: '_EditProductStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_EditProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(dynamic value) {
    final _$actionInfo = _$_EditProductStoreBaseActionController.startAction(
        name: '_EditProductStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_EditProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(dynamic value) {
    final _$actionInfo = _$_EditProductStoreBaseActionController.startAction(
        name: '_EditProductStoreBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_EditProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
collection: ${collection},
name: ${name},
description: ${description},
imageUrl: ${imageUrl},
loadingImage: ${loadingImage},
price: ${price},
errorMessage: ${errorMessage},
loading: ${loading}
    ''';
  }
}
