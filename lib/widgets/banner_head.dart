/* import 'package:flutter/material.dart';
 
void main() => runApp(const BannerHead());
 
class BannerHead extends StatelessWidget {
  const BannerHead({Key? key}) : super(key: key);
 
  static const String _title = 'Flutter Tutorial';
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}
 
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
 
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
 
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Banner(
          message: 'New Arrival',
          location: BannerLocation.topStart,
          child: Container(
            height: 200,
            width: 200,
            color: Colors.yellow,
            alignment: Alignment.center,
            child: const Text('Some Item'),
          ),
        ),
      )
    );
  }
} */