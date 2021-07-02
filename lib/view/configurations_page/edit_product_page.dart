import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mega_cardapio/model/Snack.dart';
import 'package:mega_cardapio/store/edit_product_store.dart';
import 'package:uuid/uuid.dart';

class EditProductPage extends StatefulWidget {
  final Snack? snack;
  final String? collection;
  const EditProductPage(
      {Key? key, required this.snack, required this.collection})
      : super(key: key);

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  EditProductStore editProductStore = EditProductStore();

  @override
  void initState() {
    super.initState();
    if (widget.snack != null) {
      editProductStore.name = widget.snack!.name;
      editProductStore.description = widget.snack!.description;
      editProductStore.price = widget.snack!.price.toString();
      editProductStore.imageUrl = widget.snack!.imageUrl;
      editProductStore.id = widget.snack!.id;
    } else {
      editProductStore.id = Uuid().v1();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.collection == null ? "Adicionar Produto" : "Editar Produto"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Observer(
            builder: (_) {
              return Card(
                child: GestureDetector(
                  child: Image.network(editProductStore.imageUrl),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text('Escolha uma foto'),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: () async {
                                      final PickedFile? pickedFile =
                                          await _picker.getImage(
                                              source: ImageSource.camera);
                                      if (pickedFile != null) {
                                        editProductStore
                                            .uploadImage(pickedFile);
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.camera_alt),
                                        Text("Da câmera")
                                      ],
                                    )),
                                ElevatedButton(
                                    onPressed: () async {
                                      final PickedFile? pickedFile =
                                          await _picker.getImage(
                                              source: ImageSource.gallery);
                                      if (pickedFile != null) {
                                        editProductStore
                                            .uploadImage(pickedFile);
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.image_search_rounded),
                                        Text("Da galeria")
                                      ],
                                    )),
                              ],
                            ));
                  },
                ),
              );
            },
          ),
          Observer(builder: (_) {
            return TextFormField(
              obscureText: true,
              onChanged: editProductStore.setName,
              initialValue: editProductStore.name,
              decoration: InputDecoration(hintText: "Nome"),
            );
          }),
          Observer(builder: (_) {
            return TextFormField(
              obscureText: true,
              onChanged: editProductStore.setDescription,
              initialValue: editProductStore.description,
              decoration: InputDecoration(hintText: "Descrição"),
            );
          }),
          Observer(builder: (_) {
            return TextFormField(
              obscureText: true,
              onChanged: editProductStore.setPrice,
              initialValue: editProductStore.price,
              decoration: InputDecoration(hintText: "Preço"),
            );
          }),
          Observer(builder: (_) {
            return TextFormField(
              obscureText: true,
              onChanged: editProductStore.setPrice,
              initialValue: editProductStore.price,
              decoration: InputDecoration(hintText: "Preço"),
            );
          }),
          Observer(builder: (_) {
            if (editProductStore.errorMessage.isEmpty) {
              return Container();
            } else
              return Text(
                editProductStore.errorMessage,
                style: TextStyle(color: Colors.red),
              );
          }),
          ElevatedButton(
            onPressed: editProductStore.editSnack,
            child: Observer(builder: (_) {
              if (editProductStore.loading)
                return CircularProgressIndicator(
                  color: Colors.white,
                );
              else
                return Container(
                  width: size.width,
                  child: Text(
                    "ENTRAR",
                    textAlign: TextAlign.center,
                  ),
                );
            }),
          ),
        ],
      ),
    );
  }
}
