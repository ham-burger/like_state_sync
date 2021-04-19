import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  ItemScreen({Key key}) : super(key: key);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  _ItemScreenState();

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text('detail screen'),
      ),
      body: Center(
        child: Text(
          id.toString(),
        ),
      ),
    );
  }
}
