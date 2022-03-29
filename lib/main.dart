import 'package:flutter/material.dart';
import 'package:mzar/pages/nav_pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mzar.IO App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Directionality(
            textDirection: TextDirection.rtl, child: MainPage()));
  }
}
