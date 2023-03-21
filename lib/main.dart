import 'package:boostme/responsive/mobile_screen_layout.dart';
import 'package:boostme/responsive/responsive_layout_screen.dart';
import 'package:boostme/responsive/web_screen_layout.dart';
import 'package:boostme/screens/login_screen.dart';
import 'package:boostme/screens/signup_screen.dart';
import 'package:boostme/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyC7HSiVUNkYXg_kRgI2Ol06AYscTgIJUIc',
            appId: '1:919773382052:web:f87c26a69882a5e66ded31',
            messagingSenderId: '919773382052',
            projectId: 'boostme-23977',
            storageBucket: 'boostme-23977.appspot.com'));
  } else {
    await Firebase.initializeApp();
  }

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
      // home: const ResponsiveLayout(
      //   mobilecrrenLayout: MobileScreenLayout(),
      //   webScrrenLayout: WebScreenLayout(),
      // ),
      home: SignupScreen(),
    );
  }
}
