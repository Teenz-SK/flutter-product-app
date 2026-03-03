import 'package:flutter/material.dart';
import 'screens/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(   // ❌ removed const here
      debugShowCheckedModeBanner: false,
      home: ProductsScreen(),   // no const needed
    );
  }
}