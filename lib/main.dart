import 'package:flutter/material.dart';
import 'package:kgp_ss_demo_app/MyHomePage.dart';
import 'package:profanity_filter/profanity_filter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Demo App'),
    );
  }
}

