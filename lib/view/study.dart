import 'package:flutter/material.dart';

class Study extends StatelessWidget {
  const Study({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.greenAccent),
        child: Column(
          children: [
            Text("Study"),
          ],
        ),
      ),
    );
  }
}
