import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class WebView extends StatefulWidget{
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppbar;
  final bool backForbid;

  const WebView({Key key, this.url, this.statusBarColor, this.title, this.hideAppbar, this.backForbid}) : super(key: key);


  @override
  State<StatefulWidget> createState() =>_WebViewState();
}

class _WebViewState extends State<WebView>{
  final webviewReference =  FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(null,null)

        ],
      ),
    );
  }
  _appBar(Color backColor,Color btnBackColor){
    if(widget.hideAppbar??false){
      return Container(
        color: backColor,
        height: 30,
      );
    }
    return Container(
      child: FractionallySizedBox(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.close,
                  color: btnBackColor,
                  size: 26,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Text(widget?.title,
                style: TextStyle(fontSize: 12),),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    webviewReference.close();
    _onUrlChanged =  webviewReference.onUrlChanged?.listen((String url){

    });
    webviewReference.onStateChanged.listen((WebViewStateChanged state){
      switch(state.type){
        case WebViewState.startLoad:
          break;
        case WebViewState.shouldStart:
          break;
        case WebViewState.finishLoad:
          break;
        case WebViewState.abortLoad:
          break;
      }
    });
    webviewReference.onHttpError.listen((WebViewHttpError error){
      print(error);
    });


  }

  @override
  void dispose() {
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    webviewReference.dispose();
    super.dispose();
  }

}
