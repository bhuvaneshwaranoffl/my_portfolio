import 'package:flutter/material.dart';

class Project extends StatelessWidget {
  const Project({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Text("Project"),
          ],
        ),
      ),
    );
  }
}
