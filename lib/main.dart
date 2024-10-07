import 'package:flutter/material.dart';
import 'package:maps/Screens/Screen_one.dart';
// import 'package:your_app_name/Screens/Screen1.dart';  // Import the Screen1 file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location-Based App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ScreenOne(),  // Set Screen1 as the main screen
    );
  }
}
