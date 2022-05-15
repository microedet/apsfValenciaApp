import 'package:apfsvalencia/providers/articles_provider.dart';
import 'package:apfsvalencia/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ArticlesProvider(), lazy: false ),

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
        initialRoute: 'home',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
          'detailblog': (_) => DetailBlogScreen(),
        },
        //cambiar colores
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
        ));
  }
}
