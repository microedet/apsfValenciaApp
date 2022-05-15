import 'package:apfsvalencia/screens/screens.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const _DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.pages_outlined),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.login_outlined),
            title: const Text('Login'),
            onTap: () {
              //Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
          ListTile(
            leading: const Icon(Icons.pages_outlined),
            title: const Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}
