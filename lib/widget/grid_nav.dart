import 'package:flutter/material.dart';
import 'package:flutter_xc/model/CommonModel.dart';
import 'package:flutter_xc/model/GridNavModel.dart';

import 'WebViewPage.dart';

class GridNav extends StatelessWidget {
  final GridNavModel gridNavModel;
  final String name;

  const GridNav({Key key, this.gridNavModel, this.name = "这是啥"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        clipBehavior: Clip.antiAlias,
        child: Column(children: _gridNavItems(context)));
  }

  _gridNavItems(BuildContext context) {
    List<Widget> itmes = [];
    if (gridNavModel == null) return itmes;
    if (gridNavModel.hotel != null) {
      itmes.add(_gridItem(context, gridNavModel.hotel, true));
    }
    if (gridNavModel.flight != null) {
      itmes.add(_gridItem(context, gridNavModel.flight, false));
    }

    if (gridNavModel.travel != null) {
      itmes.add(_gridItem(context, gridNavModel.travel, false));
    }

    return itmes;
  }

  _gridItem(BuildContext context, GridNavItem gridNavItem, bool first) {
    List<Widget> itmes = [];
    itmes.add(_mainItem(context, gridNavItem.mainItem));
    itmes.add(_doubleItem(context, gridNavItem.item1, gridNavItem.item2));
    itmes.add(_doubleItem(context, gridNavItem.item3, gridNavItem.item4));
    List<Widget> exitmes = [];
    itmes?.forEach((item) {
      exitmes.add(Expanded(child: item, flex: 1));
    });
    Color startColor = Color(int.parse("0xff" + gridNavItem.startColor));
    Color endColor = Color(int.parse("0xff" + gridNavItem.endColor));

    return Container(
      height: 88,
      margin: first ? null : EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [startColor, endColor])),
      child: Row(children: exitmes),
    );
  }

  _mainItem(BuildContext context, CommonModel model) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WebViewPage(title: model.title, url: model.url)));
      },
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Image.network(
            model.icon,
            fit: BoxFit.contain,
            width: 88,
            height: 121,
            alignment: AlignmentDirectional.bottomEnd,
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Text(
              model.title,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  _doubleItem(
      BuildContext context, CommonModel topItem, CommonModel bottomItem) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _item(context, topItem, true, false),
        ),
        Expanded(
          child: _item(context, bottomItem, false, false),
        )
      ],
    );
  }

  _item(BuildContext context, CommonModel item, bool first, bool isCenter) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);

    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                  left: borderSide,
                  bottom: first ? borderSide : BorderSide.none)),
          child: _wrapGesture(
              context,
              Center(
                child: Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
              item)),
    );
  }

  _wrapGesture(BuildContext context, Widget widget, CommonModel model) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WebViewPage(title: model.title, url: model.url)));
      },
      child: widget,
    );
  }
}
