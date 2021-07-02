import 'package:mega_cardapio/model/Snack.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  int currentIndex = 0;

  @action
  void updateIndex(value) => currentIndex = value;
}
