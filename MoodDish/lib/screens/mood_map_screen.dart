import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MoodMapScreen extends StatelessWidget {
  const MoodMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Mood Map')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Emotional Landscape',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ).animate().fade(duration: 500.ms).slideY(begin: -0.2),
            const SizedBox(height: 40),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const RadialGradient(
                  colors: [Colors.orange, Colors.deepPurple, Colors.blue],
                  stops: [0.2, 0.6, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 5,
                  )
                ]
              ),
              child: const Center(
                child: Text(
                  'Cozy & Adventurous',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ).animate().scale(duration: 800.ms, curve: Curves.easeOutBack)
             .shimmer(delay: 800.ms, duration: 1500.ms),
          ],
        ),
      ),
    );
  }
}
