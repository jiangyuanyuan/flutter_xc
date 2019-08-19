import 'package:flutter/material.dart';
import 'package:flutter_xc/model/CommonModel.dart';
import 'package:flutter_xc/model/GridNavModel.dart';
import 'package:flutter_xc/widget/webview.dart';

import 'WebViewPage.dart';

class SubNav extends StatelessWidget {
  final List<CommonModel> subNavModel;

  const SubNav({Key key, this.subNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    if (subNavModel == null) {
      return null;
    }
    List<Widget> items = [];
    subNavModel?.forEach((model) {
      items?.add(_item(context, model));
    });
    //计算
    int separate = (subNavModel.length / 2 + 0.5).toInt();
    return Column(
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.sublist(0, separate)),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items.sublist(separate, items.length)),
        )
      ],
    );
  }

  Widget _item(BuildContext context, CommonModel model) {
    return
      Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WebViewPage(title: model.title, url: model.url)));
          },
          child: Column(
            children: <Widget>[
              Image.network(
                model.icon,
                width: 18,
                height: 18,
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text(
                  model.title,
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
      );
  }
}
