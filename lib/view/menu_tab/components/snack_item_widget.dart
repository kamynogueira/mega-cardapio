import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mega_cardapio/color/colors.dart';
import 'package:mega_cardapio/model/Snack.dart';
import 'package:mega_cardapio/view/product_page/product_page.dart';

class SnackItemWidget extends StatelessWidget {
  final Snack snack;
  const SnackItemWidget({Key? key, required this.snack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.only(
          left: size.aspectRatio * size.height * 0.028,
          right: size.aspectRatio * size.height * 0.028,
          bottom: size.aspectRatio * size.height * 0.028),
      child: InkWell(
        splashColor: AppColors.PRIMARY_COLOR,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductPage(snack: snack),
            ),
          );
        },
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.1,
              width: size.width * 0.3,
              margin: EdgeInsets.only(right: size.width * 0.05),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(snack.imageUrl), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  snack.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.PRIMARY_COLOR),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  "R\$ ${snack.price.toStringAsFixed(2).replaceAll('.', ',')}",
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.05),
              child: Icon(Icons.navigate_next, color: AppColors.PRIMARY_COLOR),
            )
          ],
        ),
      ),
    );
  }
}
