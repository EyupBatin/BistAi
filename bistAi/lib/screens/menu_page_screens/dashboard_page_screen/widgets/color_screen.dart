import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: currentWidth < 600 ? Colors.deepPurple[300] : Colors
          .green[300],
      body: Center(
        child:Text(currentWidth.toString()),
      ),
    );
  }
}
