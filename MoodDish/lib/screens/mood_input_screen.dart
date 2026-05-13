import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/app_providers.dart';
import 'recommendation_list_screen.dart';

class MoodInputScreen extends ConsumerWidget {
  const MoodInputScreen({Key? key}) : super(key: key);

  final List<String> moods = const ['Cozy', 'Energetic', 'Light', 'Adventurous'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('How are you feeling?')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: moods.length,
        itemBuilder: (context, index) {
          final mood = moods[index];
          return InkWell(
            onTap: () {
              ref.read(selectedMoodProvider.notifier).state = mood;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RecommendationListScreen()),
              );
            },
            child: Card(
              child: Center(
                child: Text(
                  mood,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ).animate().scale(delay: (index * 100).ms, duration: 400.ms, curve: Curves.easeOutBack)
           .fade(delay: (index * 100).ms);
        },
      ),
    );
  }
}
