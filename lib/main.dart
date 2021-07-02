import 'package:flutter/material.dart';
import 'package:mega_cardapio/color/colors.dart';
import 'package:mega_cardapio/color/generate_material_color.dart';
import 'package:mega_cardapio/store/home_store.dart';
import 'package:mega_cardapio/view/splash_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeStore>(create: (_) => HomeStore()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: generateMaterialColor(AppColors.PRIMARY_COLOR),
            accentColor: AppColors.PRIMARY_COLOR,
            toggleableActiveColor: AppColors.PRIMARY_COLOR),
        home: SplashPage(),
      ),
    );
  }
}
