import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mega_cardapio/model/Snack.dart';
import 'package:mega_cardapio/view/configurations_page/components/snack_display.dart';
import 'package:mega_cardapio/view/menu_tab/components/snack_item_widget.dart';

class ConfigStreamBuilderWidget extends StatelessWidget {
  Stream<QuerySnapshot<Object?>> snapshotStream;
  String errorText;
  String emptyText;
  String collection;

  ConfigStreamBuilderWidget({
    Key? key,
    required this.snapshotStream,
    required this.errorText,
    required this.emptyText,
    required this.collection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: snapshotStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Center(
              child: Text(
                errorText,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        } else if (snapshot.data?.size == 0) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Center(
              child: Text(
                emptyText,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        } else {
          var listDocuments = snapshot.data!.docs;

          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(size.height * 0.01),
            itemCount: listDocuments.length,
            itemBuilder: (context, index) {
              Snack item = Snack.fromJson(
                  listDocuments[index].data() as Map<String, dynamic>,
                  listDocuments[index].id);
              return SnackDisplayWidget(
                snack: item,
                collection: collection,
              );
            },
          );
        }
      },
    );
  }
}
