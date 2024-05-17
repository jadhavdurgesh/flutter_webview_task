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
        child: ElevatedButton(
            onPressed: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 2, 79, 6),
                      strokeWidth: 2,
                    ),
                  );
                },
              );
              await Future.delayed(Duration(seconds: 2));
              Navigator.pop(context);
              Get.to(() => const WebViewScreen());
            },
            child: Text("WebView")),
      ),
    );
  }
}
