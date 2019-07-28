import 'package:flutter/material.dart';
import 'package:flutter_xc/navigator/tab_navigator.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: TabNavigator(),
    );
  }
}


