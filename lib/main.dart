import 'package:flutter/material.dart';
import 'package:task_riot/pages/main_page.dart';
import 'package:task_riot/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: monoDarkBlueTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: MainPage(),
    );
  }
}
