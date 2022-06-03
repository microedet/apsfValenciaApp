import 'package:apfsvalencia/screens/blog_screen.dart';
import 'package:apfsvalencia/screens/screens.dart';
import 'package:apfsvalencia/services/services.dart';
import 'package:apfsvalencia/share_preferences/preferences.dart';
import 'package:apfsvalencia/widgets/widgest.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:apfsvalencia/providers/providers.dart';
//import 'firebase_options.dart';

void main() async {
  //para inicializar valores globales
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      );
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
          create: (_) => ApiPruebaProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ApiBlogProvider(),
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
    //para cambiar el color del estado del sistema arriba hora pila etc
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APFS VALENCIA',

      initialRoute: CheckAuthScreen.routerName,
      routes: {
        CheckAuthScreen.routerName: (_) => CheckAuthScreen(),
        DetailBlogScreen.routerName: (_) => DetailBlogScreen(),
        HomeScreen.routerName: (_) => HomeScreen(),
        LoginScreen.routerName: (_) => LoginScreen(),
        ProfileScreen.routerName: (_) => ProfileScreen(),
        RegisterScreen.routerName: (_) => RegisterScreen(),
        SettingsScreen.routerName: (_) => SettingsScreen(),
        PersonalProfileScreen.routerName: (_) => PersonalProfileScreen(),
        VerifyEmailScreen.routerName: (_) => VerifyEmailScreen(),
        BlogScreen.routerName: (_) => BlogScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      //cambiar colores
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
