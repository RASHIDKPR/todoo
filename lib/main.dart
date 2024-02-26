import 'package:flutter/material.dart';
import 'package:todoo/homepage.dart';

void main() {
  runApp(MyApp());
}

final TextEditingController _taskController = TextEditingController();

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
