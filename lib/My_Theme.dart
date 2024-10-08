import 'package:flutter/material.dart';
import 'package:my_app/main.dart'; // Assuming main.dart is in the root of your project
import 'package:flutter/services.dart';
import 'package:my_app/my_theme.dart';

class My_Theme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: Colors.blue,
      accentColor: Colors.amber,
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          bodyText1: TextStyle(fontSize: 16, color: Colors.black),
          bodyText2: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        scaffoldBackgroundColor: Colors.white,
        // ... other theme properties
      );
      );
  static ThemeData darkTheme = ThemeData(
      // ... dark theme properties
      );
}

void main() {
  runApp(
    MaterialApp(
      theme: My_Theme.lightTheme, // Use your desired theme
      darkTheme: My_Theme.darkTheme, // Optional: Dark theme
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Semantics(
          label: "Search button",
          child: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search functionality
            },
          ),
        ),
      ),
      // ... other Scaffold content
    );
  }
}
