import 'package:flutter/material.dart';

class StoryBrain extends StatefulWidget {
  const StoryBrain({super.key});

  @override
  State<StoryBrain> createState() => _StoryBrainState();
}

class _StoryBrainState extends State<StoryBrain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
