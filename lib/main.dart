
import 'package:apfsvalencia/screens/screens.dart';
import 'package:apfsvalencia/services/services.dart';
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
        ChangeNotifierProvider(create: (_) => AuthService()),
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
      initialRoute: CheckAuthScreen.routerName,
      routes: {
        CheckAuthScreen.routerName  : (_) =>CheckAuthScreen(),
        DetailBlogScreen.routerName : (_) => DetailBlogScreen(),
        HomeScreen.routerName       : (_) => HomeScreen(),
        LoginScreen.routerName      : (_) => LoginScreen(),
        ProfileScreen.routerName    : (_) => ProfileScreen(),
        RegisterScreen.routerName   : (_) => RegisterScreen(),
        SettingsScreen.routerName   : (_) => SettingsScreen(),


      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      //cambiar colores
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
