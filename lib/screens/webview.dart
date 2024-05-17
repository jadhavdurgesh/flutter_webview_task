import 'package:flutter/material.dart';
import 'package:flutter_webview_task/screens/homescreen.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse("https://nutrahara.com/"));

  bool _isError = false;
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    setState(() {
      _isConnected = connectivityResult != ConnectivityResult.none;
      if (!_isConnected) {
        _isError = true;
      }
    });
  }

  void _reloadWebView() async {
    await _checkInternetConnection();
    if (_isConnected) {
      setState(() {
        _isError = false;
      });
      webViewController.loadRequest(Uri.parse("https://nutrahara.com/"));
    }
  }

  void _handleWebResourceError(WebResourceError error) {
    setState(() {
      _isError = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        Get.to(() => HomeScreen());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("WebView"),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _reloadWebView,
            ),
          ],
        ),
        body: SafeArea(
          bottom: false,
          top: false,
          child: _isError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_isConnected
                          ? "Failed to load the webpage."
                          : "No internet connection."),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _reloadWebView,
                        child: Text("Retry"),
                      ),
                    ],
                  ),
                )
              : WebViewWidget(
                  controller: webViewController,
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _reloadWebView,
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
