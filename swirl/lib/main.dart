import 'package:flutter/material.dart';
import 'package:swirl/responsive/mobile_screen_layout.dart';
import 'package:swirl/responsive/responsive_layout_screen.dart';
import 'package:swirl/responsive/web_screen_layout.dart';
import 'package:swirl/utils/colours.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swirl',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: swirlBackground1,
      ),
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}
