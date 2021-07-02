import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mega_cardapio/model/Snack.dart';
import 'package:mega_cardapio/repository/firestore_repository.dart';
import 'package:mobx/mobx.dart';
part 'menu_store.g.dart';

class MenuStore = _MenuStoreBase with _$MenuStore;

abstract class _MenuStoreBase with Store {
  FirestoreRepository _firestoreRepository = FirestoreRepository.instance;

  @observable
  List<Snack> snackList = [];

  @observable
  bool loading = false;

  @action
  Stream<QuerySnapshot> getSnacks(
      {required String collection, bool isActive = true}) {
    return _firestoreRepository.getSnacks(
        collection: collection, isActive: isActive);
  }
}
