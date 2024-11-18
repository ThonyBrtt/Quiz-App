import 'package:flutter/material.dart';
import 'teladeinicio.dart';

void main() {
  runApp(GameQuizApp());
}

class GameQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz de Games',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Inicio(),
    );
  }
}
 