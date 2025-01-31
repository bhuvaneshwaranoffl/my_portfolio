import 'package:flutter/material.dart';

class Study extends StatelessWidget {
  const Study({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Text("Study"),
          ],
        ),
      ),
    );
  }
}
