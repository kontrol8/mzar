import 'package:flutter/material.dart';
import 'package:SAMAYA/pages/nav_pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        title: 'Mzar.IO App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: AspectRatio(
          aspectRatio: 16 / 9,
          child: Directionality(
              textDirection: TextDirection.rtl, child: MainPage()),
        ));
  }
}
