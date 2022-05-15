import 'package:apfsvalencia/widgets/widgest.dart';
import 'package:flutter/material.dart';

class DetailBlogScreen extends StatelessWidget {
  static String routerName = 'DetailBlog';


  const DetailBlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Cambiar por una instacion de noticia
    final String article =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-article';

    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: Color.fromRGBO(34, 80, 53, 1),
        centerTitle: true,
        title: const Text(''),
      ), */
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _ArticleText(),
              _ArticleText(),
              _ArticleText(),
              _ArticleText(),
              _ArticleText(),
              _ArticleText(),
              _ArticleText(),
              _ArticleText(),
              _ArticleText(),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color.fromRGBO(34, 80, 53, 1),
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: EdgeInsets.all(0),
          title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            child: Text(
              'Titulo noticia',
              style: TextStyle(fontSize: 16),
            ),
          ),
          background: FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://via.placeholder.com/500x300'),
            fit: BoxFit.cover,
          )),
    );
  }
}

class _ArticleText extends StatelessWidget {
  const _ArticleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'Anim reprehenderit qui pariatur nostrud magna aliquip magna cupidatat dolore voluptate cupidatat anim. Ad sint nulla cupidatat elit ut qui et dolore aliquip ex aliqua pariatur irure. Qui commodo velit ut ullamco laboris sunt consectetur cillum culpa. In consequat pariatur ipsum qui ad ea pariatur veniam sint do ex aliquip. Reprehenderit proident mollit aute ipsum deserunt aute exercitation amet incididunt eu ullamco ullamco.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
