import 'package:flutter/material.dart';
import 'package:mega_cardapio/color/colors.dart';
import 'package:mega_cardapio/model/Snack.dart';
import 'package:mega_cardapio/view/menu_tab/components/leading_title_widget.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final Snack snack;
  const ProductPage({Key? key, required this.snack}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.35,
              margin: EdgeInsets.all(size.aspectRatio * size.height * 0.02),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.snack.imageUrl),
                    fit: BoxFit.fitHeight),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
            ),
            LeadingTitleWidget(
              title: widget.snack.name,
            ),
            Text(
              "R\$ ${widget.snack.price.toStringAsFixed(2).replaceAll('.', ',')}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              widget.snack.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
