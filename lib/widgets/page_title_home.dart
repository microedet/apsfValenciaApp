import 'package:flutter/material.dart';

class PageTitleHome extends StatelessWidget {
  const PageTitleHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric( horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text('Bienvenidos', style: TextStyle(fontSize:25,fontWeight: FontWeight.bold ,color: Colors.black87)),
            SizedBox(height: 10),
            Text('Asociación de Padres Separados', style: TextStyle(fontSize:20 ,color: Colors.black87)),         ],
        ),
      ),
    );
  }
}
