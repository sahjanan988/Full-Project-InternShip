import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
 Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: 
 Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello, World!', style: TextStyle(fontSize: 24)), 

            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: Text('Click me'),
            ),
          ],
        ),
      ),
    );
  }
}


void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.amber,  

        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 16.0),
        ),
      ),
      home: MyHomePage(),
    ),
  );
}