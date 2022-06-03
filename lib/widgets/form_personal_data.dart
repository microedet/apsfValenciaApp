/* diseño de tarjeta blanca de datos personales*/

import 'package:apfsvalencia/screens/screens.dart';
import 'package:apfsvalencia/widgets/widgest.dart';
import 'package:flutter/material.dart';

class PersonalData extends StatelessWidget {
    final Widget child;

  const PersonalData({Key? key, required this.child}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        //height: 300,
        padding: EdgeInsets.all(20),
        decoration: _createCardRedonda(),
        child: this.child,
      ),
    );
  }

  BoxDecoration _createCardRedonda() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black54, blurRadius: 15, offset: Offset(0, 5))
          ]);
}
