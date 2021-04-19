import 'package:flutter/material.dart';

import 'presentation/feature/item/item_screen.dart';
import 'presentation/feature/items/items_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => ItemsScreen(),
        '/detail': (BuildContext context) => ItemScreen(),
      },
    );
  }
}
