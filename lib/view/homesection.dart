import 'package:flutter/material.dart';

class Homesection extends StatelessWidget {
  const Homesection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.greenAccent
        ),
        child: Column(
          children: [
            Text("Home Page"),
          
          ],
        ),
      ),
    );
  }
}