import 'package:apfsvalencia/screens/login_screen.dart';
import 'package:apfsvalencia/services/auth_service.dart';
import 'package:apfsvalencia/widgets/widgest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static String routerName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authservice = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(34, 80, 53, 1),
        centerTitle: true,
        title: const Text('APFS VALENCIA'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.login_outlined),
            onPressed: () {
              authservice.logout();
              Navigator.pushReplacementNamed(context, LoginScreen.routerName);
            },
          ),
        ],
      ),
      drawer: const SideMenu(),
        body: Stack(
        children: [
          const HomeBackground(),
          _HomeBody(),
          ],
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children:[

            //titulos
             PageTitleHome(),
            //table menus
           SizedBox(height: 60),

            MenuTable(),
            

          ],
        ),

    );
  }
}
