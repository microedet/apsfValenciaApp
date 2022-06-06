// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart';
import 'package:apfsvalencia/screens/screens.dart';
import 'package:flutter/material.dart';

class DetailBlogScreen extends StatelessWidget {
  static String routerName = 'DetailBlog';
  String titulo;
  String image;
  String content;

  DetailBlogScreen(this.titulo, this.image, this.content, {Key? key})
      : super(key: key);
  //DetailBlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final DetallesBlog args = ModalRoute.of(context).settings.arguments.toString();

    /* final String article =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-article'; */

    return Scaffold(
      appBar: AppBar(
        /* leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.popAndPushNamed(context, BlogScreen.routerName);
          },
        ), */
        backgroundColor: const Color.fromRGBO(34, 80, 53, 1),
        centerTitle: true,
        title: Text(titulo),
      ),
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(
            titulo: titulo,
            imagen: image,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _ArticleText(
                content: content,
              ),
              const SizedBox(height: 50)
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  String titulo;
  String imagen;

  _CustomAppBar({required this.titulo, required this.imagen, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromRGBO(34, 80, 53, 1),
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: const EdgeInsets.all(0),
          title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            //child: Html(data: titulo),
            child: Text(
              titulo,
              style: const TextStyle(fontSize: 16),
            ), 
          ),
          background: FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image:
                NetworkImage('https://apsvalencia.pythonanywhere.com' + imagen),
            fit: BoxFit.cover,
          )),
    );
  }
}

class _ArticleText extends StatelessWidget {
  String content;
  

  _ArticleText({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //hacemos que se lean las etiquetas html
    var document = parse(content);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Html(data: content),
      // child: Text(
      //   document.toString(),
      //   textAlign: TextAlign.justify,
      //   style: Theme.of(context).textTheme.subtitle1,
      // ),
    );
  }
}
