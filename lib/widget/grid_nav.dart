import 'package:flutter/material.dart';
import 'package:flutter_xc/model/GridNavModel.dart';

class GridNav extends StatelessWidget{
  final GridNavModel gridNavModel;
  final String name;

  const GridNav({Key key, this.gridNavModel, this.name="这是啥"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(name);
  }
}

