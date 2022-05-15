import 'package:flutter/material.dart';

import '../share_preferences/preferences.dart';
import '../widgets/widgest.dart';

class ProfileScreen extends StatelessWidget {
  static String routerName = 'Profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(34, 80, 53, 1),
          centerTitle: true,
          title: const Text('PERFIL'),
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text('Modo Oscuro: ${Preferences.isModoOscuro}'),
              Divider(),
              Text('Género:  ${Preferences.genero} '),
              Divider(),
              Text('Nombre de usuario:  ${Preferences.name} '),
              Divider(),
            ],
          ),
        );
  }
}
