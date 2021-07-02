import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mega_cardapio/repository/firestore_repository.dart';
import 'package:mega_cardapio/view/home_page/home_page.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error initializing Firebase');
          } else if (snapshot.connectionState == ConnectionState.done) {
            FirestoreRepository.instance
                .setFirebaseApp(snapshot.data as FirebaseApp);
            return HomePage();
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (context) => HomePage()));
          }
          return Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Image.asset("assets/images/logo_mega.png"),
            ),
          );
        },
      ),
    );
  }
}
