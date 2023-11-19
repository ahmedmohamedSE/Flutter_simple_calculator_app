import 'package:flutter/material.dart';

import 'mySimpleCalculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Calculator',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyCalcHomeScreen(),
    );
  }
}
