import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({Key? key}) : super(key: key);

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
 

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:
           Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: "https://news.thedigitalkranti.com/",
                zoomEnabled: false,
                onWebViewCreated: ((WebViewController webViewController) {
                  _completer.complete(webViewController);
                }),
              ),
            ),
    );
  }
}
