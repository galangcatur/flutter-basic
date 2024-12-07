import 'package:flutter/material.dart';

class Iconns extends StatelessWidget {
  static IconData? favorite;
  
  static IconData? audiotrack;
  
  static IconData? beach_access;

  const Iconns({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('icons')),
      body: Center(
        child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: <Widget>[
    Icon(
      Icons.favorite,
      color: Colors.black,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),
    Icon(
      Icons.audiotrack,
      color: Colors.red,
      size: 30.0,
    ),
    Icon(
      Icons.beach_access,
      color: Colors.blue,
      size: 36.0,
    ),
  ],
)
      ),
    );
  }
}