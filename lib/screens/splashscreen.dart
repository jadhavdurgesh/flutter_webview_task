import 'package:flutter/material.dart';
import 'package:flutter_webview_task/screens/homescreen.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.off(() => HomeScreen());
    });

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Center(
              child: Image.asset(
            "assets/images/nutrahara-logo.png",
            height: 40,
          )),
          30.heightBox,
          CircularProgressIndicator(
            color: Color.fromARGB(255, 2, 79, 6),
            strokeWidth: 2,
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Text(
            "Nutrahara: Nourishing Women Naturally \n Trusted by Millions",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 2, 79, 6),
                fontWeight: FontWeight.w600),
          ),
          Container(
            height: 40,
          )
        ],
      ),
    );
  }
}
