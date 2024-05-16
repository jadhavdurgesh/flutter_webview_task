import 'package:flutter/material.dart';
import 'package:flutter_webview_task/screens/webview.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Webview Task"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Get.to(()=> const WebViewScreen());
        }, child: Text("WebView")),
      ),
    );
  }
}