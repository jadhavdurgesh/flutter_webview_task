import 'package:flutter/material.dart';
import 'package:flutter_webview_task/screens/homescreen.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {

  final webViewController = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(Uri.parse("https://nutrahara.com/"));
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
          Get.to(() => HomeScreen());
      },
      child: SafeArea(
        bottom: false,
        top: false,
        child: WebViewWidget(controller: webViewController,)),
    );
  }
}