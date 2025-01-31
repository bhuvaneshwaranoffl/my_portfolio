import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       width: double.infinity,
        decoration: BoxDecoration(color: Colors.greenAccent),
        child: Column(
          children: [
            Text("Skills"),
          ],
        ),
      ),
    );
  }
}
