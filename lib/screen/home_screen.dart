import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

String url = 'https://mlbpark.donga.com/mp/b.php?select=sct&m=search&b=kbotown&select=spf&query=%EB%A1%AF%EB%8D%B0&x=28&y=8';

class HomeScreen extends StatelessWidget {
  WebViewController? controller;

  HomeScreen({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
        appBar: AppBar(
          title: Text('MLBPark 롯데'),
          backgroundColor: Colors.orange,
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              SystemNavigator.pop();
            }, icon: Icon(Icons.exit_to_app)),
            IconButton(onPressed: () {
              if (controller != null) {
                controller!.loadUrl(url);
              }
            }, icon: Icon(Icons.home)),

          ],
        ),
        body: WebView(
          onWebViewCreated: (WebViewController controller) {
            this.controller = controller;
          },
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        )
    ), onWillPop: (){
      var future = controller?.canGoBack();
      future?.then((canGoBack) {
        if(canGoBack){
          controller?.goBack();
        }
        else{
          print("no page");

        }


      });
      return Future.value(false);
    });
  }
}