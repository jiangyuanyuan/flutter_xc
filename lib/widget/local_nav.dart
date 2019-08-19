import 'package:flutter/material.dart';
import 'package:flutter_xc/model/CommonModel.dart';
import 'package:flutter_xc/model/GridNavModel.dart';
import 'package:flutter_xc/widget/webview.dart';

import 'WebViewPage.dart';

class LocalNav extends StatelessWidget {
  final List<CommonModel> localNavModel;

  const LocalNav({Key key, this.localNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (localNavModel == null) {
      return null;
    }
    List<Widget> items = [];
    localNavModel?.forEach((model) {
      items?.add(_item(context, model));
    });
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: items);
  }

  Widget _item(BuildContext context, CommonModel model) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WebViewPage(title : model.title,url: model.url)));
      },
      child: Column(
        children: <Widget>[
          Image.network(
            model.icon,
            width: 32,
            height: 32,
          ),
          Text(
            model.title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
