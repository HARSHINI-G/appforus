import 'package:app_for_us/first.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const us());
}class us extends StatelessWidget {
  const us({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage()
    );
  }
}