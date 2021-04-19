import 'package:flutter/material.dart';
import 'package:like_state_sync/domain/item/Item_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final ItemRepository _itemRepository = ItemRepository();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            var item = _itemRepository.items()[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.description),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: _itemRepository.items().length),
    );
  }
}
