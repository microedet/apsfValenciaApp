import 'package:flutter/material.dart';

class MenuTable extends StatelessWidget {
  const MenuTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _SingleCard(
              color: Colors.white, icon: Icons.access_alarm, text: 'General'),
          _SingleCard(
              color: Colors.white, icon: Icons.border_all, text: 'Hijos'),
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.white, icon: Icons.file_copy_sharp, text: 'General'),
          _SingleCard(
              color: Colors.white, icon: Icons.border_all, text: 'Hijos'),
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.white, icon: Icons.file_copy_sharp, text: 'General'),
          _SingleCard(
              color: Colors.white, icon: Icons.border_all, text: 'Hijos'),
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

  const _SingleCard(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Icon(Icons.pie_chart_sharp, size: 40),
            radius: 30,
          ),
          SizedBox(height: 10),
          Text(this.text, style: TextStyle(color: this.color, fontSize: 18))
        ],
      ),
    );
  }
}
