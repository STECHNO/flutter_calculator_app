import 'package:flutter/material.dart';
import 'calculator.dart';

// Calculator App made by Saleheen Noor.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Calculator(),
      )
      );
  }
}