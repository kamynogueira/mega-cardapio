import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:mega_cardapio/color/colors.dart';
import 'package:mega_cardapio/repository/firestore_repository.dart';
import 'package:mega_cardapio/view/configurations_page/configurations_page.dart';
import 'package:mega_cardapio/view/login_page/login_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactTab extends StatelessWidget {
  const ContactTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.06,
              top: size.height * 0.02,
              right: size.width * 0.04),
          child: Column(
            children: [
              Text(
                "Informações de contato",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                children: [
                  Text(
                    "Endereço:",
                    style: TextStyle(
                      color: AppColors.PRIMARY_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  SelectableText(
                    "Av. Costa e Silva",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  InkWell(
                    child: Text(
                      "veja no mapa",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () => launchMaps(),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    "Contato:",
                    style: TextStyle(
                      color: AppColors.PRIMARY_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  GestureDetector(
                    child: Text(
                      "(67) 982080115",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onTap: () async => _launchUrl("tel:+55 67 99999999"),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    "Horário de Funcionamento:",
                    style: TextStyle(
                      color: AppColors.PRIMARY_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Container(
                    width: size.width * 0.38,
                    child: SelectableText(
                      "De Terça à Domingo das 16h às 23h",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.4,
              ),
              TextButton.icon(
                onPressed: () {
                  var route;
                  if (FirestoreRepository.instance.isLoggedIn())
                    route = ConfigurationsPage();
                  else
                    route = LoginPage();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => route,
                    ),
                  );
                },
                icon: Icon(Icons.supervisor_account_rounded),
                label: Text("Área Restrita"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchMaps() async {
    final availableMaps = await MapLauncher.installedMaps;
    print(
        availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

    await availableMaps.first.showMarker(
        coords: Coords(-20.50, -54.61),
        title: "Mega Restaurante",
        zoom: 1,
        description: "Aqui tem Mega refeições");
  }
}
