import 'package:flutter/material.dart';
import '../models/dish.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';

class DishDetailScreen extends ConsumerWidget {
  final Dish dish;

  const DishDetailScreen({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mood = ref.watch(selectedMoodProvider);

    return Scaffold(
      appBar: AppBar(title: Text(dish.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (dish.imagePath != null)
              Image.asset(dish.imagePath!, height: 200, width: double.infinity, fit: BoxFit.cover)
            else
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey[300],
                child: const Icon(Icons.fastfood, size: 50, color: Colors.grey),
              ),
            const SizedBox(height: 16),
            Text(
              dish.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text('\$${dish.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, color: Colors.green)),
            const SizedBox(height: 16),
            Text(dish.description),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Why this matches your "$mood" mood: This dish contains flavors that perfectly align with your current emotional state.',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
