import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mega_cardapio/color/colors.dart';
import 'package:mega_cardapio/store/login_store.dart';
import 'package:mega_cardapio/view/configurations_page/configurations_page.dart';
import 'package:mobx/mobx.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginStore loginStore = LoginStore();

  late ReactionDisposer disposer;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => loginStore.success, (_) {
      if (loginStore.success) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => ConfigurationsPage(),
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Área Privada"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Insira suas credenciais",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.PRIMARY_COLOR),
            ),
            Observer(builder: (_) {
              return TextFormField(
                onChanged: loginStore.setEmail,
                decoration: InputDecoration(hintText: "Email"),
                keyboardType: TextInputType.emailAddress,
              );
            }),
            SizedBox(
              height: size.height * 0.01,
            ),
            Observer(builder: (_) {
              if (loginStore.emailMessage == null ||
                  loginStore.emailMessage!.isEmpty)
                return Container();
              else
                return Text(
                  loginStore.emailMessage!,
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.red),
                );
            }),
            Observer(builder: (_) {
              return TextFormField(
                obscureText: true,
                onChanged: loginStore.setSenha,
                decoration: InputDecoration(hintText: "Senha"),
              );
            }),
            SizedBox(
              height: size.height * 0.01,
            ),
            Observer(builder: (_) {
              if (loginStore.passwordMessage == null ||
                  loginStore.passwordMessage!.isEmpty)
                return Container();
              else
                return Text(
                  loginStore.passwordMessage!,
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.red),
                );
            }),
            SizedBox(
              height: size.height * 0.01,
            ),
            ElevatedButton(
              onPressed: () {
                var emailError = loginStore.verifyEmail();
                var passwordError = loginStore.verifySenha();
                if (emailError != null) {
                  loginStore.emailMessage = emailError;
                  loginStore.passwordMessage = null;
                } else if (passwordError != null) {
                  loginStore.passwordMessage = passwordError;
                  loginStore.emailMessage = null;
                } else {
                  loginStore.emailMessage = null;
                  loginStore.passwordMessage = null;

                  loginStore.login();
                }
              },
              child: Observer(builder: (_) {
                if (loginStore.loading)
                  return CircularProgressIndicator(
                    color: Colors.white,
                  );
                else
                  return Container(
                    width: size.width,
                    child: Text(
                      "ENTRAR",
                      textAlign: TextAlign.center,
                    ),
                  );
              }),
            ),
            Observer(builder: (_) {
              if (loginStore.errorMessage == null ||
                  loginStore.errorMessage!.isEmpty)
                return Container();
              else
                return Text(
                  loginStore.errorMessage!,
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.red),
                );
            }),
          ],
        ),
      ),
    );
  }
}
