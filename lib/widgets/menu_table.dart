import 'package:apfsvalencia/screens/screens.dart';
import 'package:apfsvalencia/widgets/widgest.dart';
import 'package:flutter/material.dart';

class MenuTable extends StatelessWidget {
  const MenuTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _SingleCard(
              color: Colors.white,
              icon: Icons.person_off_outlined,
              text: 'Perfil Personal',
              route:PersonalProfileScreen.routerName),
          _SingleCard(
              color: Colors.white,
              icon: Icons.family_restroom_outlined,
              text: 'Familia',
              route: RegisterScreen.routerName),
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.white,
              icon: Icons.question_answer_outlined,
              text: 'Consultas',
              route: HomeScreen.routerName),
          _SingleCard(
              color: Colors.white,
              icon: Icons.new_releases_outlined,
              text: 'Blog',
              route: HomeScreen.routerName),
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.white,
              icon: Icons.question_answer_sharp,
              text: 'Preguntas Frecuentes',
              route: HomeScreen.routerName),
          _SingleCard(
              color: Colors.white,
              icon: Icons.subscriptions_outlined,
              text: 'Suscripción',
              route: HomeScreen.routerName),
        ])
      ],
    );
  }
}

//icono del menu un cuadrado
class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final String route;

  const _SingleCard(
      {Key? key, required this.icon, required this.color, required this.text, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, this.route);
      },
      child: Container(
        margin: EdgeInsets.all(15),
        height: 180,
        decoration: BoxDecoration(
            color: Color.fromRGBO(34, 80, 53, 0.7),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: this.color,
              child: Icon(this.icon, size: 40),
              radius: 30,
            ),
            SizedBox(height: 10),
            Text(this.text, style: TextStyle(color: this.color, fontSize: 18))
          ],
        ),
      ),
    );
  }
}
