import 'package:flutter/material.dart';
import 'package:whether_app_api/pages/whether_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'whether APP',
      home: WhetherPages(),
  
    );
  }
}


