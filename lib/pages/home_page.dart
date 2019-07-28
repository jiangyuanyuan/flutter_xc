import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


const APPBAR_OFFSET =100;
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  final List _imageList = [
    "https://dimg04.c-ctrip.com/images/350p1600000109qx2C354_C_500_280_Q80.jpg",
    "https://dimg06.c-ctrip.com/images/350r0o000000enmc1BFDC_C_500_280_Q80.jpg"
  ];
  double appBarAlpha = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child:NotificationListener(
                  onNotification: (scrollNotication){
                    if(scrollNotication is ScrollUpdateNotification &&scrollNotication.depth==0){
                      _Scroll(scrollNotication.metrics.pixels);
                    }
                  },
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 160,
                        child: Swiper(itemCount: _imageList.length,
                          autoplay: true,
                          itemBuilder: (BuildContext context,int index){
                            return Image.network(
                              _imageList[index],
                              fit: BoxFit.fill,
                            );
                          },
                          pagination: SwiperPagination(),
                        ),

                      ),
                      Container(
                        height: 800,
                        child: ListTile(title: Text("哈哈哈")),
                      )
                    ],
                  ))
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("首页"),),
              ),
            ),
          )
        ],
      )


    );
  }

  _Scroll(pixels) {
    double alpha = pixels/APPBAR_OFFSET;
    if(alpha<0){
      alpha = 0;
    }else if (alpha>1){
      alpha =1;
    }
    setState(() {
      appBarAlpha=alpha;
    });
  }

}