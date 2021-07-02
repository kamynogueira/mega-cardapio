import 'package:flutter/material.dart';
import 'package:mega_cardapio/store/menu_store.dart';
import 'package:mega_cardapio/view/menu_tab/components/leading_title_widget.dart';
import 'package:mega_cardapio/view/menu_tab/components/stream_builder_widget.dart';

// ignore: must_be_immutable
class MenuTab extends StatelessWidget {
  MenuTab({Key? key}) : super(key: key);
  MenuStore menuStore = MenuStore();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LeadingTitleWidget(title: "Combos"),
          StreamBuilderWidget(
            snapshotStream: menuStore.getSnacks(collection: "combos"),
            isCarousel: true,
            errorText:
                "Ops, parece que um erro ocorreu. \n Nos desculpe pelo inconveniente e tente novamente mais tarde",
            emptyText:
                "Parece que não há nada por aqui...\n Será que está na hora de um novo MEGA lanche??",
          ),
          LeadingTitleWidget(title: "Lanches"),
          StreamBuilderWidget(
            snapshotStream: menuStore.getSnacks(collection: "meals"),
            errorText:
                "Ops, parece que um erro ocorreu. \n Nos desculpe pelo inconveniente e tente novamente mais tarde",
            emptyText:
                "Parece que não há nada por aqui...\n Será que está na hora de um novo MEGA lanche??",
          ),
          LeadingTitleWidget(title: "Bebidas"),
          StreamBuilderWidget(
            snapshotStream: menuStore.getSnacks(collection: "drinks"),
            errorText:
                "Ops, parece que um erro ocorreu. \n Nos desculpe pelo inconveniente e tente novamente mais tarde",
            emptyText:
                "Parece que não há nada por aqui...\n Será que está na hora de uma nova MEGA bebida??",
          ),
        ],
      ),
    );
  }
}
