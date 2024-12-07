import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Containers')),
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(
            height:
                Theme.of(context).textTheme.headlineMedium!.fontSize! * 1.1 +
                    200.0,
          ),
          padding: const EdgeInsets.all(8.0),
          color: Colors.red[600],
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(0.1),
          child: Text('Hallo banng',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
