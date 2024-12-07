import 'package:flutter/material.dart';
import 'package:flutter_application_1/buttons.dart';
import 'package:flutter_application_1/containers.dart';
import 'package:flutter_application_1/colomms.dart';
import 'package:flutter_application_1/Rows.dart';
import 'package:flutter_application_1/Iconns.dart';
import 'package:flutter_application_1/Scaffolds.dart';
import 'package:flutter_application_1/Forms.dart';
import 'package:flutter_application_1/Text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class Project {
  final String name;
  final Widget page;

  Project({required this.name, required this.page});
}

class HomePage extends StatelessWidget {
  final List<Project> projects = [
    Project(name: 'container', page: Containers()),
    Project(name: 'colom', page: Colomms()),
    Project(name: 'row', page: Rows()),
    Project(name: 'button', page: Buttons()),
    Project(name: 'icon', page: Iconns()),
    Project(name: 'scaffold', page: Scaffolds()),
    Project(name: 'form', page: Forms()),
    Project(name: 'text', page: Texts()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('list broo')),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return ListTile(
            title: Text(project.name),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => project.page),
              );
            },
          );
        },
      ),
    );
  }
}
