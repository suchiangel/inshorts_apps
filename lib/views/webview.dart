import 'dart:async';
import 'package:flutter/material.dart';
import 'package:inshorts_app/model/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  String slugCategory;
   WebviewPage({Key? key,required this.slugCategory}) : super(key: key);

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  List<NewsModel> newsList = [];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:
           Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: widget.slugCategory,
                zoomEnabled: false,
                onWebViewCreated: ((WebViewController webViewController) {
                  _completer.complete(webViewController);
                }),
              ),
            ),
    );
  }
}
