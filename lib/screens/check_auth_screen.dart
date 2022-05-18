import 'package:apfsvalencia/screens/home_screen.dart';
import 'package:apfsvalencia/screens/login_screen.dart';
import 'package:apfsvalencia/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
  static String routerName = 'checkauth';

  const CheckAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: authService.readToken(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (!snapshot.hasData) return const Text('Espere');

              if (snapshot.data == '') {
                //esta función se cumple cuando se crea el widget
                Future.microtask(() {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => LoginScreen(),
                          transitionDuration: Duration(seconds: 0)));
                });
              } else {
                 Future.microtask(() {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => HomeScreen(),
                          transitionDuration: Duration(seconds: 0)));
                });

              }
              return Container();
            }),
      ),
    );
  }
}
