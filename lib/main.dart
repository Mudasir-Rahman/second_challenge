import 'package:flutter/material.dart';
import 'package:second_boss/story_brain.dart';

void main() {
  runApp(const DistiniApp()); // ✅ Added const
}

class DistiniApp extends StatelessWidget {
  const DistiniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Distini',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  // ✅ Use final to prevent accidental reassignment
  final StoryBrain storyBrain = StoryBrain();

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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: 20.0,
            ),
            child: Column(
              // ✅ Pushes text/buttons to the bottom
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  storyBrain.storyText,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30.0),

                // ✅ Choice 1 Button
                _buildChoiceButton(storyBrain.choice1Text, Colors.red, 1),
                const SizedBox(height: 15.0),

                // ✅ Choice 2 Button (only shows if text exists)
                if (storyBrain.choice2Text.isNotEmpty)
                  _buildChoiceButton(storyBrain.choice2Text, Colors.blue, 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Reusable button builder
  Widget _buildChoiceButton(String text, Color color, int choiceNumber) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            // ✅ Handle restart vs next story
            if (text == 'Restart') {
              storyBrain.reset();
            } else {
              storyBrain.nextStory(choiceNumber);
            }
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
        child: Text(
          text, // ✅ Now correctly matches the button's purpose
          style: const TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
    );
  }
}
