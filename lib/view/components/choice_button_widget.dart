import 'package:flutter/material.dart';

Widget customButton(String text, Function onPressed) {
  return ButtonTheme(
    minWidth: 350.0,
    height: 60.0,
    // ignore: deprecated_member_use
    child: RaisedButton(
      child: Text(
        "$text",
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color: Color(0xffE8E8E8),
      onPressed: onPressed(),
    ),
  );
}
