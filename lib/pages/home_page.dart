import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  final List _imageList = [
    "https://dimg04.c-ctrip.com/images/350p1600000109qx2C354_C_500_280_Q80.jpg",
    "https://dimg06.c-ctrip.com/images/350r0o000000enmc1BFDC_C_500_280_Q80.jpg"
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
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

            )
          ],
        )
      ),
    );
  }

}