import 'package:flutter/material.dart';

class Holamundo extends StatelessWidget {
      static String routerName = 'Hola';

  const Holamundo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(34, 80, 53, 1),
          title: const Text('APFS VALENCIA'),
        ),
       body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Hola Mundo',
              textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
        );
  }
}
