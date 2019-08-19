import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_xc/dao/home_dao.dart';
import 'package:flutter_xc/model/CommonModel.dart';
import 'package:flutter_xc/model/GridNavModel.dart';
import 'package:flutter_xc/model/HomeModel.dart';
import 'package:flutter_xc/widget/grid_nav.dart';
import 'package:flutter_xc/widget/local_nav.dart';
import 'package:flutter_xc/widget/sub_nav.dart';

const APPBAR_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _imageList = [
    "https://dimg04.c-ctrip.com/images/350p1600000109qx2C354_C_500_280_Q80.jpg",
    "https://dimg06.c-ctrip.com/images/350r0o000000enmc1BFDC_C_500_280_Q80.jpg"
  ];
  var resultString = "";
  double appBarAlpha = 0;
  List<CommonModel> localNavList = [];
  List<CommonModel> subNavList = [];
  GridNavModel gridNavModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: NotificationListener(
                    onNotification: (scrollNotication) {
                      if (scrollNotication is ScrollUpdateNotification &&
                          scrollNotication.depth == 0) {
                        _Scroll(scrollNotication.metrics.pixels);
                      }
                    },
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: 160,
                          child: Swiper(
                            itemCount: _imageList.length,
                            autoplay: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Image.network(
                                _imageList[index],
                                fit: BoxFit.fill,
                              );
                            },
                            pagination: SwiperPagination(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                          child: LocalNav(localNavModel: localNavList),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                          child: GridNav(gridNavModel: gridNavModel),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                          child: SubNav(subNavModel: subNavList),
                        ),
                        Container(
                          height: 800,
                          child: ListTile(title: Text(resultString)),
                        )
                      ],
                    ))),
            Opacity(
              opacity: appBarAlpha,
              child: Container(
                height: 80,
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("首页"),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  @override
  void initState() {
    _loadDate();
  }

  _Scroll(pixels) {
    double alpha = pixels / APPBAR_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  _loadDate() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        localNavList = model.localNavList;
        gridNavModel = model.gridNav;
        subNavList = model.subNavList;
      });
    } catch (e) {
      print(e);
    }
  }
}
