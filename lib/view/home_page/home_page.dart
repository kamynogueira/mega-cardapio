import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mega_cardapio/store/home_store.dart';
import 'package:mega_cardapio/view/cart_tab/cart_tab.dart';
import 'package:mega_cardapio/view/contact_tab/contact_tab.dart';
import 'package:mega_cardapio/view/menu_tab/menu_tab.dart';
import 'package:provider/provider.dart';

import '../../color/colors.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [
            MenuTab(),
            ContactTab(),
          ],
        ),
        appBar: AppBar(
          title: Text("Mega Restaurante"),
          bottom: TabBar(
            tabs: [Icon(Icons.menu_book), Icon(Icons.phone)],
          ),
        ),
      ),
    );
  }
}
