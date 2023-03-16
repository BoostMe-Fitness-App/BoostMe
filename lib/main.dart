import 'package:boostme/responsive/mobile_screen_layout.dart';
import 'package:boostme/responsive/responsive_layout_screen.dart';
import 'package:boostme/responsive/web_screen_layout.dart';
import 'package:boostme/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      title: 'BoostMe',
      home: const ResponsiveLayout(
        mobilecrrenLayout: MobileScreenLayout(),
        webScrrenLayout: WebScreenLayout(),
      ),
    );
  }
}
