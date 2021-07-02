import 'package:flutter/material.dart';
import 'package:mega_cardapio/store/menu_store.dart';
import 'package:mega_cardapio/view/configurations_page/components/config_stream_builder_widget.dart';
import 'package:mega_cardapio/view/configurations_page/edit_product_page.dart';

class EditMenuPage extends StatefulWidget {
  EditMenuPage({Key? key}) : super(key: key);

  @override
  _EditMenuPageState createState() => _EditMenuPageState();
}

class _EditMenuPageState extends State<EditMenuPage> {
  MenuStore menuStore = MenuStore();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Editar cardápio"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditProductPage(
                snack: null,
                collection: null,
              ),
            ),
          );
        },
      ),
      body: Column(
        children: [
          Text(
            "Combos",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ConfigStreamBuilderWidget(
            snapshotStream: menuStore.getSnacks(collection: "combos"),
            collection: "combos",
            errorText:
                "Ops, parece que um erro ocorreu. \n Nos desculpe pelo inconveniente e tente novamente mais tarde",
            emptyText:
                "Parece que não há nada por aqui...\n Será que está na hora de um novo MEGA lanche??",
          ),
          Text(
            "Lanches",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ConfigStreamBuilderWidget(
            snapshotStream: menuStore.getSnacks(collection: "meals"),
            errorText:
                "Ops, parece que um erro ocorreu. \n Nos desculpe pelo inconveniente e tente novamente mais tarde",
            collection: "meals",
            emptyText:
                "Parece que não há nada por aqui...\n Será que está na hora de um novo MEGA lanche??",
          ),
          Text(
            "Bebidas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ConfigStreamBuilderWidget(
            snapshotStream: menuStore.getSnacks(collection: "drinks"),
            collection: "drinks",
            errorText:
                "Ops, parece que um erro ocorreu. \n Nos desculpe pelo inconveniente e tente novamente mais tarde",
            emptyText:
                "Parece que não há nada por aqui...\n Será que está na hora de uma nova MEGA bebida??",
          ),
        ],
      ),
    ));
  }
}
