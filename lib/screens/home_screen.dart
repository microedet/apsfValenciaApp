import 'package:apfsvalencia/widgets/widgest.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    



    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(34, 80, 53, 1),
          centerTitle: true,
          title: const Text('APFS VALENCIA'),
        ),
        drawer: const SideMenu(),
        body: SingleChildScrollView(
          child: Column(
            children: [CardBlog()],
          ),
        ));
  }
}
