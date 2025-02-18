import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // ✅ Import your HomeScreen correctly

void main() {
  runApp(const RecipeBookApp());
}

class RecipeBookApp extends StatelessWidget {
  const RecipeBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),  // ✅ This should load the actual HomeScreen
    );
  }
}
