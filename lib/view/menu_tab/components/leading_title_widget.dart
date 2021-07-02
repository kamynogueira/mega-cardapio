import 'package:flutter/material.dart';
import 'package:mega_cardapio/color/colors.dart';

// ignore: must_be_immutable
class LeadingTitleWidget extends StatelessWidget {
  String title;
  LeadingTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.01),
      child: Text(
        title,
        style: TextStyle(
            color: AppColors.PRIMARY_COLOR,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
    );
  }
}
