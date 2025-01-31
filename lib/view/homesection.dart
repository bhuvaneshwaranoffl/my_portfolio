
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Homesection extends StatelessWidget {
  const Homesection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.greenAccent,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive layout: Stack for mobile, Row for larger screens
          if (constraints.maxWidth < 600) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildImage(),
                const SizedBox(height: 20),
                _buildTextContent(),
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildTextContent(),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: _buildImage(),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  // Build the text content
  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Name
        const Text(
          "Bhuvaneshwaran",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        // Typewriter Animation for "Developer | Innovator | Creator"
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              "Developer | Innovator | Creator",
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              speed: const Duration(milliseconds: 120),
            ),
          ],
          totalRepeatCount: 100, // Loop the animation
          pause: const Duration(milliseconds: 500),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
        const SizedBox(height: 20),
        // Tagline
        const Text(
          "Crafting Ideas Into Reality | Skilled in Flutter, Node.js, MongoDB, and More",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        // Intro
        const Text(
          "Hi, I'm Bhuvaneshwaran, a passionate developer specializing in building dynamic applications and seamless user experiences. With expertise in Flutter, Node.js, MongoDB, and more, I bring ideas to life through code.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  // Build the image
  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child:Image.asset('mine.png',
        width: 300,
        height: 500,
        fit: BoxFit.cover,
      ),
    );
  }
}