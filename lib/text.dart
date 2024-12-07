import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  const Texts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text')),
      body: Center(
        child: Container(
  width: 100,
  decoration: BoxDecoration(border: Border.all()),
  child: Text(overflow: TextOverflow.ellipsis, 'ttolak impostor' )
  )
      ),
    );
  }
}


class _name {

}