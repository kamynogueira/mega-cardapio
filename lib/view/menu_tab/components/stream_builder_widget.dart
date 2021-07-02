import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:mega_cardapio/color/colors.dart';
import 'package:mega_cardapio/model/Snack.dart';
import 'package:mega_cardapio/view/menu_tab/components/snack_item_widget.dart';
import 'package:mega_cardapio/view/product_page/product_page.dart';

// ignore: must_be_immutable
class StreamBuilderWidget extends StatelessWidget {
  Stream<QuerySnapshot<Object?>> snapshotStream;
  String errorText;
  String emptyText;
  bool isCarousel;
  StreamBuilderWidget({
    Key? key,
    required this.snapshotStream,
    required this.errorText,
    required this.emptyText,
    this.isCarousel = false,
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
          if (!isCarousel)
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(size.height * 0.01),
              itemCount: listDocuments.length,
              itemBuilder: (context, index) {
                Snack item = Snack.fromJson(
                    listDocuments[index].data() as Map<String, dynamic>,
                    listDocuments[index].id);
                return SnackItemWidget(
                  snack: item,
                );
              },
            );
          else
            return Container(
              height: size.height * 0.2,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: listDocuments.length,
                itemBuilder: (context, index) {
                  Snack item = Snack.fromJson(
                      listDocuments[index].data() as Map<String, dynamic>,
                      listDocuments[index].id);
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductPage(snack: item),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.15,
                          width: size.width * 0.3,
                          margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.032,
                          ),
                          padding: EdgeInsets.only(bottom: size.height * 0.1),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(item.imageUrl),
                                fit: BoxFit.fitHeight),
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                        ),
                        Text(
                          item.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColors.PRIMARY_COLOR,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
        }
      },
    );
  }
}
