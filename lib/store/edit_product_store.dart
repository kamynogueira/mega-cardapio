import 'package:image_picker/image_picker.dart';
import 'package:mega_cardapio/model/ErrorMessage.dart';
import 'package:mega_cardapio/repository/firestore_repository.dart';
import 'package:mobx/mobx.dart';
part 'edit_product_store.g.dart';

class EditProductStore = _EditProductStoreBase with _$EditProductStore;

abstract class _EditProductStoreBase with Store {
  @observable
  String id = "";

  @observable
  String collection = "";

  @observable
  String name = "";

  @action
  void setName(value) => name = value;

  @observable
  String description = "";

  @action
  void setDescription(value) => description = value;

  @observable
  String imageUrl =
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fst2.depositphotos.com%2F5470330%2F8162%2Fv%2F950%2Fdepositphotos_81627162-stock-illustration-french-fries-hamburger-and-soda.jpg&f=1&nofb=1";

  @observable
  bool loadingImage = false;

  @action
  Future<void> uploadImage(PickedFile file) async {
    loadingImage = true;
    var response = await FirestoreRepository.instance.uploadImage(file, id);
    if (response is ErrorMessage) {
      errorMessage = response.message;
    } else {
      imageUrl = response;
    }

    loadingImage = false;
  }

  @observable
  String price = "";

  @action
  void setPrice(value) => price = value;

  @observable
  String errorMessage = "";

  @observable
  bool loading = false;
  @action
  Future<void> editSnack() async {}
}
