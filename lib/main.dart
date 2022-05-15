import 'package:apfsvalencia/providers/articles_provider.dart';
import 'package:apfsvalencia/providers/theme_provider.dart';
import 'package:apfsvalencia/screens/screens.dart';
import 'package:apfsvalencia/share_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apfsvalencia/providers/providers.dart';

void main() async {
  //para inicializar valores globales
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ArticlesProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
            create: (_) =>
                ThemeProvider(isModoOscuro: Preferences.isModoOscuro)),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APFS VALENCIA',
      initialRoute: HomeScreen.routerName,
      routes: {
        LoginScreen.routerName: (_) => LoginScreen(),
        HomeScreen.routerName: (_) => HomeScreen(),
        DetailBlogScreen.routerName: (_) => DetailBlogScreen(),
        ProfileScreen.routerName: (_) => ProfileScreen(),
        SettingsScreen.routerName: (_) => SettingsScreen(),
        RegisterScreen.routerName: (_) => RegisterScreen(),


      },
      //cambiar colores
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
