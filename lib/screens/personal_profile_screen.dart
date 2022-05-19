import 'package:apfsvalencia/widgets/widgest.dart';
import 'package:flutter/material.dart';


class PersonalProfileScreen extends StatelessWidget {
  static String routerName = 'PersonalProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(34, 80, 53, 1),
        title: const Text('APFS VALENCIA'),
      ),
      body: Stack(
        children: [
          const BackgroundAllScreen(),
          HomeBody(),
        ],
      ),
    );
  }
}
