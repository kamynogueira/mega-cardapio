import 'package:flutter/material.dart';
import 'package:mega_cardapio/repository/firestore_repository.dart';
import 'package:mega_cardapio/view/configurations_page/edit_menu_page.dart';

import '../components/choice_button_widget.dart';

class ConfigurationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Área Restrita"),
        actions: [
          IconButton(
              onPressed: () {
                FirestoreRepository.instance.signOut();

                Navigator.pop(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        color: Color(0xffF6F6F6),
        child: ListView(children: <Widget>[
          Divider(color: Color(0xffF6F6F6), height: 17.0),
          Container(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage('assets/images/logo_mega.png'),
              width: 150.0,
              alignment: Alignment.center,
            ),
          ),
          Container(
            color: Color(0xffF6F6F6),
            padding: EdgeInsets.all(19.0),
            child: Column(
              children: <Widget>[
                // customButton("Gerenciar Usuários", () {
                //   Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (context) => GerenciarFunc(),
                //     ),
                //   );
                // }),
                Divider(color: Color(0xffF6F6F6), height: 15.0),
                customButton("Alterar Cardápio", () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditMenuPage(),
                    ),
                  );
                }),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
