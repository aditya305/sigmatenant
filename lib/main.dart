import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sigma Tenant",
      home: HomePage(),
      routes: {
        SplashScreen.tag: (context) => SplashScreen(),
        HomePage.tag: (context) => HomePage(),
      },
    );
  }
}




// displayName
// description
// metaTags
