import 'package:catapp/models/breeds.dart';
import 'package:catapp/pages/screen_breeds.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp (
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      
      home: BreedsPage(),
    );
  }
}